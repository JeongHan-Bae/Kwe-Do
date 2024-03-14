from setuptools import setup, find_packages

setup(
    name='kwe-do',
    version='1.0',
    packages=find_packages(),
    package_data={'kwe_do': ['*.pyd', '*.pyi']},
    include_package_data=True,
    install_requires=[],  # Add any dependencies here
    author='JH Bae',
    description='Kwe_Do is a Python package that provides functionality for shuffling lists according to various '
                'shuffle patterns and analyzing the behavior of shuffle patterns.',
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
    ],
)
