# Kwe_Do

Kwe_Do is a Python package that provides functionality for shuffling lists according to various shuffle patterns and analyzing the behavior of shuffle patterns.

## Library Structure
```markdown
Kwe_Do_Library
│
├── kwe_do (library folder for Windows)
│   ├── __init__.py
│   ├── orbit.cp310-win_amd64.pyd (compiled Cython file for orbit submodule)
│   ├── orbit.pyi (interface pyi file for orbit submodule)
│   ├── shuffle.cp310-win_amd64.pyd (compiled Cython file for shuffle submodule)
│   └── shuffle.pyi (interface pyi file for shuffle submodule)
│
├── mac_build (folder for building in Mac system)
│   ├── kwe_do (output folder for Mac system)
│   │   ├── __init__.py
│   │   ├── orbit.cpython-39-darwin.so (compiled Cython file for orbit submodule on Mac)
│   │   ├── orbit.pyi (interface pyi file for orbit submodule)
│   │   ├── shuffle.cpython-39-darwin.so (compiled Cython file for shuffle submodule on Mac)
│   │   └── shuffle.pyi (interface pyi file for shuffle submodule)
│   ├── wheel (folder containing the compiled wheel for Mac)
│   │   └── kwe_do-1.0-py3-none-any.whl (for Mac)
│   └── setup.py (wrapper for the library for Mac system)
│
├── src (Cython source files)
│   ├── orbit.pyx (Cython source file for orbit submodule)
│   ├── shuffle.pyx (Cython source file for shuffle submodule) 
│   └── setup.py (setup script to compile the Cython files; replace the pyd files in the kwe_do folder for Linux or macOS)
│
├── wheel (folder containing the compiled wheel for Windows)
│   └── kwe_do-1.0-py3-none-any.whl (for Windows only)
│
├── LICENSE
├── README.md
├── requirements.txt
└── setup.py (wrapper for the library; ensure the pyd files are compiled according to your platform before compiling)
```

## Program Structure

The package consists of two main modules:

1. Shuffle Module: Provides classes and functions for creating shuffle patterns and shuffling lists according to these patterns.
2. Orbit Module: Contains functions for analyzing the behavior of shuffle patterns, such as calculating the orbit and idempotence.

## Main Functions

### Shuffle Module

#### `pattern` Class

- **Initialization**: Initialize a shuffle pattern object.
- **Get Length**: Get the length of the pattern.
- **Convert to List**: Convert the pattern to a list.
- **Shuffle**: Shuffle a list according to the pattern.
- **Orbit**: Calculate the orbit of the pattern.
- **Idempotence**: Calculate the idempotence of a list under the pattern.
- **Reverse**: Generate a new pattern representing the reverse of the current pattern.
- **Repeat**: Repeat the pattern a specified number of times.

#### Additional Functions

- **Faro-in**: Create a pattern for the faro-in shuffle.
- **Faro-out**: Create a pattern for the faro-out shuffle.
- **Monge-in**: Create a pattern for the monge-in shuffle.
- **Monge-out**: Create a pattern for the monge-out shuffle.

### Orbit Module

#### Functions

- **Orbit**: Calculate the orbit of a shuffle pattern.
- **Shuffles**: Perform shuffling operations on a list using a given shuffle pattern.
- **Idempotence**: Calculate the idempotence of a list based on a given shuffle pattern.
- **Repeat**: Repeat a shuffle pattern a specified number of times.
- **Reverse**: Reverse a shuffle pattern.

## Installation

The package can be installed using the provided wheel file located in the `wheel` directory. Simply download the appropriate wheel file for your platform and install it using pip:

```bash
pip install wheel/kwe_do-1.0-py3-none-any.whl

```
For Mac users please download by

```bash
pip install mac_build/wheel/kwe_do-1.0-py3-none-any.whl

```

## Mac Build Construction

The macOS version of Kwe_Do was constructed by [WaltonR1](https://github.com/waltonR1). WaltonR1 contributed to the development by setting up the necessary configurations and compiling the Cython files specifically for the macOS platform. The Mac build directory (`mac_build`) contains the compiled `.so` files and the wheel file (`kwe_do-1.0-py3-none-any.whl`) tailored for macOS systems.

Walton's contributions ensured that users on macOS can seamlessly install and use the Kwe_Do package for their projects.



## Usage

See [Kwe Do API](Kwe_Do_API.md)

## License

This package is distributed under the [MIT License](LICENSE)

## About the Name "Kwe Do"

The name "Kwe Do" is a romanization of the sino-Korean word "궤도"(軌道), which translates to "orbit" in English. 
This name was chosen to reflect the package's focus on analyzing permutation orbits, which are fundamental to shuffling algorithms. 
The term "orbit" also evokes the concept of objects moving in a circular path, akin to how elements move within a shuffle pattern.

<div align="center">
  <img src="https://github.com/JeongHan-Bae/Kwe-Do/assets/128088756/72f4c19b-8371-480e-8cc4-8ab196fb5571" alt="kwe_do_ico">
</div>
