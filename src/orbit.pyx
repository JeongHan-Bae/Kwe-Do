# cython: language_level=3
from typing import List, Dict, Any, Optional

from shuffle import pattern

def orbit(patt_list: list[int], index: int = 0) -> int:
    pattern_instance: pattern = pattern(initializer_list=patt_list, index=index)
    return pattern_instance.orbit()

def shuffles(deck_list: list, patt_list: list[int], times: int, index: int = 0) -> List[int]:
    # Check if the lengths of deck_list and patt_list are the same
    if len(deck_list) != len(patt_list):
        raise ValueError("Length of deck_list must match the length of patt_list")

    return pattern(initializer_list=patt_list, index=index)\
        .repeat(times).shuffle(deck_list)

def idem(deck_list: list, patt_list: list[int], index: int = 0) -> int:
    # Check if the lengths of deck_list and patt_list are the same
    if len(deck_list) != len(patt_list):
        raise ValueError("Length of deck_list must match the length of patt_list")

    pattern_instance: pattern = pattern(initializer_list=patt_list, index=index)
    cdef int index_counter = 0
    cdef int length = len(deck_list)
    helper_dict: Dict[Any, int] = {}
    identity_list: List[Optional[int]] = [None] * length

    # Iterate over the deck_list
    for ele in deck_list:
        # Check if the element is not in the dictionary
        if ele not in helper_dict:
            # Add the element to the dictionary with its index
            helper_dict[ele] = index_counter
            index_counter += 1

    # Enumerate the deck_list again to create the identity_list
    for i, ele in enumerate(deck_list):
        identity_list[i] = helper_dict[ele]

    return pattern_instance.idempotence(identity_list)

def repeat(patt_list: list[int], times: int, index: int = 0) -> List[int]:
    return pattern(initializer_list=patt_list, index=index)\
        .repeat(times).to_list(index=index)

def reverse(patt_list: list[int], index: int = 0) -> List[int]:
    return pattern(initializer_list=patt_list, index=index)\
        .reverse().to_list(index=index)