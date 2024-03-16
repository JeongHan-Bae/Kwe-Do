import sys
from setuptools import setup, find_packages

# Determine the platform
if sys.platform == 'win32':
    # Windows-specific package data
    package_data = {'kwe_do': ['*.pyd', '*.pyi']}
    platform_name = 'win_amd64'  # Adjust for Windows platform
    system = 'Windows'
    os_classifier = 'Operating System :: Microsoft :: Windows'
elif sys.platform == 'darwin':
    # macOS-specific package data
    package_data = {'kwe_do': ['*.so', '*.pyi']}
    platform_name = 'macosx_10_9_x86_64'  # Adjust for macOS platform
    system = 'MacOS'
    os_classifier = 'Operating System :: MacOS :: MacOS X'
else:
    # Default to .so for Linux and other platforms
    package_data = {'kwe_do': ['*.so', '*.pyi']}
    platform_name = 'manylinux1_x86_64'  # Adjust for Linux and other platforms
    system = 'Linux'
    os_classifier = 'Operating System :: POSIX :: Linux'

setup(
    name='kwe-do',
    version='1.0',
    packages=find_packages(),
    package_data=package_data,
    include_package_data=True,
    install_requires=[],  # Add any dependencies here
    author='JH Bae',
    description='Kwe_Do is a Python package that provides functionality for shuffling lists according to various '
                'shuffle patterns and analyzing the behavior of shuffle patterns.',
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        os_classifier,
    ],
    # Specify platform name for the wheel file
    options={'bdist_wheel': {'plat_name': platform_name}},
)
