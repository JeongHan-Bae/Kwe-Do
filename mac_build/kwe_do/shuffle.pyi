# shuffle.pyi

from typing import List, TypeVar

T = TypeVar("T")


class pattern:
    def __init__(self, initializer_list: List[int] = None, index: int = 0) -> None:
        """
        Initialize the pattern object.

        Parameters:
            initializer_list (Optional[List[int]]): List of integers representing the pattern.
            index (int): Starting index for the pattern. Default is 0 (0-index).
                If set to 1, the pattern will be interpreted as 1-indexed.
        """
        ...

    def get_length(self: "pattern") -> int:
        """
        Get the length of the pattern.

        Returns:
            int: Length of the pattern.
        """
        ...

    def to_list(self: "pattern", index: int = 0) -> List[int]:
        """
        Convert the pattern to a list.

        Parameters:
            index (int): Starting index for the list. Default is 0 (0-index).
                If set to 1, the resulting list will be 1-indexed.

        Returns:
            List[int]: List representation of the pattern.
        """
        ...

    def shuffle(self: "pattern", lst: List[T]) -> List[T]:
        """
        Shuffle a list according to the pattern.

        Parameters:
            lst (List[T]): The list to shuffle. Must match the length of the pattern.

        Returns:
            List[T]: Shuffled list.

        Raises:
            ValueError: If the length of the input list does not match the length of the pattern.
        """
        ...

    def orbit(self: "pattern") -> int:
        """
        Calculate the orbit of the pattern.

        Returns:
            int: Number of shuffles required for the pattern to return to its original state.
        """
        ...

    def idempotence(self: "pattern", lst: List[int]) -> int:
        """
        Calculate the idempotence of a list under the pattern.

        Parameters:
            lst (List[int]): The list to analyze. Must match the length of the pattern.

        Returns:
            int: Number of shuffles required for the list to return to its original state.

        Raises:
            ValueError: If the length of the input list does not match the length of the pattern.
        """
        ...

    def reverse(self: "pattern") -> "pattern":
        """
        Generate a new pattern representing the reverse of the current pattern.

        Returns:
            pattern: New pattern representing the reverse of the current pattern.
        """
        ...

    def repeat(self: "pattern", times: int) -> "pattern":
        """
        Repeat the pattern a specified number of times.

        Parameters:
            times (int): Number of times to repeat the pattern. Can be positive or negative.

        Returns:
            pattern: New pattern resulting from repeating the current pattern.

        Raises:
            MemoryError: If memory allocation fails during pattern generation.
        """
        ...


def faro_in(n: int) -> pattern:
    """
    Create a pattern for the faro-in shuffle.

    Parameters:
        n (int): Number of elements in the pattern.

    Returns:
        pattern: Pattern object for the faro-in shuffle.
    """
    ...


def faro_out(n: int) -> pattern:
    """
    Create a pattern for the faro-out shuffle.

    Parameters:
        n (int): Number of elements in the pattern.

    Returns:
        pattern: Pattern object for the faro-out shuffle.
    """
    ...


def monge_in(n: int) -> pattern:
    """
    Create a pattern for the monge-in shuffle.

    Parameters:
        n (int): Number of elements in the pattern.

    Returns:
        pattern: Pattern object for the monge-in shuffle.
    """
    ...


def monge_out(n: int) -> pattern:
    """
    Create a pattern for the monge-out shuffle.

    Parameters:
        n (int): Number of elements in the pattern.

    Returns:
        pattern: Pattern object for the monge-out shuffle.
    """
    ...
