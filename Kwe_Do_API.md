# Kwe_Do API Documentation

## Shuffle Module

### Pattern Class

#### `pattern` class

Represents a shuffle pattern.

##### `__init__(initializer_list: Optional[List[int]] = None, index: int = 0) -> None`

Initializes the pattern object.

- `initializer_list` (Optional[List[int]]): List of integers representing the pattern.
- `index` (int): Starting index for the pattern. Default is 0 (0-index). If set to 1, the pattern will be interpreted as 1-indexed.

##### `get_length() -> int`

Returns the length of the pattern.

Returns:
- int: Length of the pattern.

##### `to_list(index: int = 0) -> List[int]`

Converts the pattern to a list.

- `index` (int): Starting index for the list. Default is 0 (0-index). If set to 1, the resulting list will be 1-indexed.

Returns:
- List[int]: List representation of the pattern.

##### `shuffle(lst: List[T]) -> List[T]`

Shuffles a list according to the pattern.

- `lst` (List[T]): The list to shuffle. Must match the length of the pattern.

Returns:
- List[T]: Shuffled list.

Raises:
- ValueError: If the length of the input list does not match the length of the pattern.

##### `orbit() -> int`

Calculates the orbit of the pattern.

Returns:
- int: Number of shuffles required for the pattern to return to its original state.

##### `idempotence(lst: List[int]) -> int`

Calculates the idempotence of a list under the pattern.

- `lst` (List[int]): The list to analyze. Must match the length of the pattern.

Returns:
- int: Number of shuffles required for the list to return to its original state.

Raises:
- ValueError: If the length of the input list does not match the length of the pattern.

##### `reverse() -> pattern`

Generates a new pattern representing the reverse of the current pattern.

Returns:
- pattern: New pattern representing the reverse of the current pattern.

##### `repeat(times: int) -> pattern`

Repeats the pattern a specified number of times.

- `times` (int): Number of times to repeat the pattern. Can be positive or negative.

Returns:
- pattern: New pattern resulting from repeating the current pattern.

Raises:
- MemoryError: If memory allocation fails during pattern generation.

#### `faro_in(n: int) -> pattern`

Creates a pattern for the faro-in shuffle.

- `n` (int): Number of elements in the pattern.

Returns:
- pattern: Pattern object for the faro-in shuffle.

#### `faro_out(n: int) -> pattern`

Creates a pattern for the faro-out shuffle.

- `n` (int): Number of elements in the pattern.

Returns:
- pattern: Pattern object for the faro-out shuffle.

#### `monge_in(n: int) -> pattern`

Creates a pattern for the monge-in shuffle.

- `n` (int): Number of elements in the pattern.

Returns:
- pattern: Pattern object for the monge-in shuffle.

#### `monge_out(n: int) -> pattern`

Creates a pattern for the monge-out shuffle.

- `n` (int): Number of elements in the pattern.

Returns:
- pattern: Pattern object for the monge-out shuffle.

## Orbit Module

### Functions

#### `orbit(patt_list: List[int], index: int = 0) -> int`

Calculates the orbit of a shuffle pattern.

- `patt_list`: List of integers representing the shuffle pattern.
- `index` (int): Starting index for the pattern (default is 0).

Returns:
- The orbit of the shuffle pattern as an integer.

#### `shuffles(deck_list: List[Any], patt_list: List[int], times: int, index: int = 0) -> List[int]`

Performs shuffling operations on a list using a given shuffle pattern.

- `deck_list`: The list to be shuffled.
- `patt_list`: List of integers representing the shuffle pattern.
- `times`: The number of times to repeat the shuffle operation.
- `index` (int): Starting index for the pattern (default is 0).

Returns:
- The shuffled list.

#### `idem(deck_list: List[Any], patt_list: List[int], index: int = 0) -> int`

Calculates the idempotence of a list based on a given shuffle pattern.

- `deck_list`: The list for which idempotence is to be calculated.
- `patt_list`: List of integers representing the shuffle pattern.
- `index` (int): Starting index for the pattern (default is 0).

Returns:
- The idempotence of the list as an integer.

#### `repeat(patt_list: List[int], times: int, index: int = 0) -> List[int]`

Repeats a shuffle pattern a specified number of times.

- `patt_list`: List of integers representing the shuffle pattern.
- `times`: The number of times to repeat the pattern.
- `index` (int): Starting index for the pattern (default is 0).

Returns:
- The repeated shuffle pattern as a list.

#### `reverse(patt_list: List[int], index: int = 0) -> List[int]`

Reverses a shuffle pattern.

- `patt_list`: List of integers representing the shuffle pattern.
- `index` (int): Starting index for the pattern (default is 0).

Returns:
- The reversed shuffle pattern as a list.