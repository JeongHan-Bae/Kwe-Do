# orbit.pyi

from typing import List, Any


def orbit(patt_list: List[int], index: int = 0) -> int:
    """
    Calculate the orbit of a shuffle pattern.

    Parameters:
        patt_list: List of integers representing the shuffle pattern.
        index: Starting index for the pattern (default is 0).

    Returns:
        The orbit of the shuffle pattern as an integer.
    """


def shuffles(
    deck_list: List[Any], patt_list: List[int], times: int, index: int = 0
) -> List[int]:
    """
    Perform shuffling operations on a list using a given shuffle pattern.

    Parameters:
        deck_list: The list to be shuffled.
        patt_list: List of integers representing the shuffle pattern.
        times: The number of times to repeat the shuffle operation.
        index: Starting index for the pattern (default is 0).

    Returns:
        The shuffled list.
    """


def idem(deck_list: List[Any], patt_list: List[int], index: int = 0) -> int:
    """
    Calculate the idempotence of a list based on a given shuffle pattern.

    Parameters:
        deck_list: The list for which idempotence is to be calculated.
        patt_list: List of integers representing the shuffle pattern.
        index: Starting index for the pattern (default is 0).

    Returns:
        The idempotence of the list as an integer.
    """


def repeat(patt_list: List[int], times: int, index: int = 0) -> List[int]:
    """
    Repeat a shuffle pattern a specified number of times.

    Parameters:
        patt_list: List of integers representing the shuffle pattern.
        times: The number of times to repeat the pattern.
        index: Starting index for the pattern (default is 0).

    Returns:
        The repeated shuffle pattern as a list.
    """


def reverse(patt_list: List[int], index: int = 0) -> List[int]:
    """
    Reverse a shuffle pattern.

    Parameters:
        patt_list: List of integers representing the shuffle pattern.
        index: Starting index for the pattern (default is 0).

    Returns:
        The reversed shuffle pattern as a list.
    """
