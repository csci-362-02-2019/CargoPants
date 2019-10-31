# This bash script is designed to run
#  five test cases on Rgb2HexDriver.
# This is to demo how the runAllTests will
#  work on a single driver.


# array of test cases
declare -a TESTCASES=(
    "../testCases/testCase01.txt"
    "../testCases/testCase02.txt"
    "../testCases/testCase03.txt"
    "../testCases/testCase04.txt"
    "../testCases/testCase05.txt"
    )


# run each test case through the driver
for input in ${TESTCASES[@]}
do
    # declare variables based on template
    CASE=$(sed '1!d' "$input")
    DRIVER=$(sed '5!d' "$input")
    ARGS=$(sed '6!d' "$input")
    ORACLE=$(sed '7!d' "$input")

    # walk to bin/
    cd ../project/bin/
    

    # run driver
    printf "Test case: ${CASE}\n"
    #printf "java \"test.${DRIVER}\" ${ARGS}\n" #debug
    printf "Result: "
    java "test.${DRIVER}" ${ARGS}
    printf "Oracle: ${ORACLE}\n"

    cd ../../scripts/
    
    echo
done