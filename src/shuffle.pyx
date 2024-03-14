# cython: language_level=3

from typing import List, Optional, Any, Type, Set

from libc.stdlib cimport malloc, free


cdef class pattern:
    cdef int length
    cdef int* patt_arr

    def __cinit__(self, initializer_list: Optional[List[int]] = None, int index = 0):
        """
        Initialize the pattern object.

        Parameters:
            initializer_list (Optional[List[int]]): List of integers representing the pattern.
            index (int): Starting index for the pattern.
        """
        cdef int index_local = index
        cdef int i, num

        if initializer_list is None:
            self.length = 0
            self.patt_arr = NULL
            return

        # Check if all elements are integers
        for elem in initializer_list:
            if not isinstance(elem, int):
                raise TypeError("All elements of the input list must be integers")

        # Initialize length and allocate memory for pattern array
        self.length = len(initializer_list)
        self.patt_arr = <int*>malloc(self.length * sizeof(int))
        if self.patt_arr == NULL:
            raise MemoryError("Failed to allocate memory")

        check_set: Set[int] = set(initializer_list)

        if len(check_set) < self.length:
            raise ValueError("Input list is not a valid shuffle pattern")

        # Fill pattern array and update check list
        for i in range(self.length):
            num = initializer_list[i] - index_local
            if num < 0 or num >= self.length:
                raise ValueError("Input list is not a valid shuffle pattern")
            self.patt_arr[i] = num

    def __dealloc__(self):
        if self.patt_arr:
            free(<int *>self.patt_arr)

    def get_length(self):
        return self.length

    def to_list(self, index: int = 0) -> List[int]:
        cdef int[:] pattern_array_view = <int[:self.length]>self.patt_arr
        return [pattern_array_view[i] + index for i in range(self.length)]

    def shuffle(self, lst: List[Any]) -> List[Any]:
        # Check if the length of the list matches the length of the pattern
        if len(lst) != self.length:
            raise ValueError("Length of input list must match the length of the pattern")

        cdef int i
        new_lst: List[Any] = [None] * self.length

        # Shuffle the list according to the pattern
        for i in range(self.length):
            new_lst[i] = lst[self.patt_arr[i]]

        return new_lst

    cdef void c_shuffle(self, int* array):
        cdef int *temp = <int *> malloc(self.length * sizeof(int))
        if temp == NULL:
            raise MemoryError("Failed to allocate memory for the temporary array")
        for i in range(self.length):
            temp[i] = array[self.patt_arr[i]]
        for i in range(self.length):
            array[i] = temp[i]
        free(<int *>temp)


    def orbit(self) -> int:
        cdef int length = self.length
        cdef int *target = <int *> malloc(length * sizeof(int))
        cdef int *process = <int *> malloc(length * sizeof(int))
        cdef int count = 1
        cdef int i

        if target == NULL or process == NULL:
            raise MemoryError("Failed to allocate memory for target or process array")

        # Initialize target array
        for i in range(length):
            target[i] = i
            process[i] = self.patt_arr[i]


        # Check if the pattern matches the target
        while True:
            for i in range(length):
                if process[i] != target[i]:
                    break
            else:
                break
            self.c_shuffle(process)
            count += 1

        # Free memory
        free(<int *>target)
        free(<int *>process)

        return count
    def idempotence(self, lst: List[int]) -> int:
        if len(lst) != self.length:
            raise ValueError("Length of input list must match the length of the pattern")

        # Create copies of the original and current lists
        cdef int *original_list = <int *> malloc(self.length * sizeof(int))
        cdef int *current_list = <int *> malloc(self.length * sizeof(int))

        # Initialize count of shuffles
        cdef int count = 0

        # Assign values to both lists
        for i in range(self.length):
            original_list[i] = lst[i]
            current_list[i] = lst[i]

        # Loop until the list becomes identical to the original
        while True:
            self.c_shuffle(current_list)
            count += 1

            # Check if the current list matches the original
            for i in range(self.length):
                if current_list[i] != original_list[i]:
                    break
            else:
                break

        # Free memory for the original and current lists
        free(<int *> original_list)
        free(<int *> current_list)

        return count

    def reverse(self) -> Type[pattern]:
        cdef int *patt = <int *> malloc(self.length * sizeof(int))
        if patt == NULL:
            raise MemoryError("Failed to allocate memory for the reverse array")
        for i in range(self.length):
            patt[self.patt_arr[i]] = i
        cdef pattern pattern_instance = pattern()
        _initialize_pattern(pattern_instance, self.length, patt)
        return pattern_instance

    def repeat(self, times: int) -> Type[pattern]:
        cdef int *patt = <int *> malloc(self.length * sizeof(int))

        if patt == NULL:
            raise MemoryError("Failed to allocate memory for the reverse array")
        cdef int orbit = self.orbit()
        for i in range(self.length):
            patt[i] = i
        if times > 0:
            for j in range(times % orbit):
                self.c_shuffle(patt)
        elif times < 0:
            for j in range(orbit + times % orbit):
                self.c_shuffle(patt)
        cdef pattern pattern_instance = pattern()
        _initialize_pattern(pattern_instance, self.length, patt)

        return pattern_instance



cdef void _initialize_pattern(pattern instance, int length, int * patt_arr):
    if instance.patt_arr != NULL:
        free(<int *> instance.patt_arr)
    instance.length = length
    instance.patt_arr = patt_arr


def faro_in(int n) -> Type[pattern]:
    if n % 2:
        raise ValueError("Input must be even for faro_in")
    cdef pattern pattern_instance = pattern()
    cdef int i
    cdef int *patt_arr
    patt_arr = <int *>malloc(n * sizeof(int))
    if patt_arr == NULL:
        raise MemoryError("Failed to allocate memory for pattern array")
    parity: int = 0
    half: int = n // 2
    for i in range(n):
        patt_arr[i] = i // 2 + parity * half
        parity = 1 - parity
    _initialize_pattern(pattern_instance, n, patt_arr)
    return pattern_instance

def faro_out(int n) -> Type[pattern]:
    if n % 2:
        raise ValueError("Input must be even for faro_out")
    cdef pattern pattern_instance = pattern()
    cdef int i
    cdef int *patt_arr
    patt_arr = <int *>malloc(n * sizeof(int))
    if patt_arr == NULL:
        raise MemoryError("Failed to allocate memory for pattern array")
    parity: int = 1
    half: int = n // 2
    for i in range(n):
        patt_arr[i] = i // 2 + parity * half
        parity = 1 - parity
    _initialize_pattern(pattern_instance, n, patt_arr)
    return pattern_instance

def monge_in(int n) -> Type[pattern]:
    return monge_helper(n, True) # type: ignore

def monge_out(int n) -> Type[pattern]:
    return monge_helper(n, False) # type: ignore

cdef pattern monge_helper(int n, bint direction):
    cdef pattern pattern_instance = pattern()
    cdef int i
    cdef int *patt_arr
    patt_arr = <int *> malloc(n * sizeof(int))
    if patt_arr == NULL:
        raise MemoryError("Failed to allocate memory for pattern array")
    cdef int index = 0
    if n % 2:
        for val in range(n - 1 if direction else n - 2, -1 if direction else 0, -2):
            patt_arr[index] = val
            index += 1
    else:
        for val in range(n - 2 if direction else n - 1, -1 if direction else 0, -2):
            patt_arr[index] = val
            index += 1
    for val in range(1 if direction else 0, n, 2):
        patt_arr[index] = val
        index += 1
    _initialize_pattern(pattern_instance, n, patt_arr)
    return pattern_instance