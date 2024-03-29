### CSCI 362 - Software Engineering

Fall, 2019

## Team CargoPants

Members:
- Collin Bauer
- Isabel Lally
- Dylan Evans


This repository tests code from [Tanaguru Contrast Finder](). Portions of the code were
transferred to `TeamAtomation/project/src/` and sever test drivers were written to test
various methods from within.

# Running the repository

This respository was built to run on Ubuntu 16.04. Java JDK 1.7 is required.

To run the tests provided in this repository, navigate to `path/to/CargoPants/TestAutomation/`,
then run the following script:

```
$ bash ./scripts/runAllTests.sh
```

The script will compile the source code and all drivers for the tests, then individually
run all test cases provided in `./testCases/`. The output results will be opened in a temporary HTML file.

*(Note that the script will only execute from the specified directory.)*

To add your own scripts, navigate to `path/to/CargoPants/TestAutomation/testCases/` and write the teast cases according to `testTemplate.txt`. The testing structure will automatically detect the new test case and execute it, assuming that the specified driver exists.
