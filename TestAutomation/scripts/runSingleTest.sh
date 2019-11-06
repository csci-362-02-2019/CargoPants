# Helper method that runs a single test case,
#  provided the test file as an argument.
#
# If Java produces an exception, the exception
#  will be printed to the terminal it was run
#  from, regardless of if this output is being
#  piped. Exceptions need to be caught to
#  prevent this issue.


# check if directory is valid
if [ ${PWD:len-14:14} != "TestAutomation" ]; then
    echo "Script must be run from TestAutomation."
    exit
fi

# check for argument
if [ $# -eq 0 ]; then
    echo "No arguments provided."
    exit
fi

#echo $1 #debug

# first argument is the input file
input="./testCases/$1"

# declare variables based on template
case=$(sed '1!d' "$input")
reqmnt=$(sed '2!d' "$input")
method=$(sed '4!d' "$input")
driver=$(sed '5!d' "$input")
args=$(sed '6!d' "$input")
oracle=$(sed '7!d' "$input")

# walk to bin/
cd ./project/bin/

# run driver and store result as variable
output=$(java "test.$driver" $args)
result=$(diff -q <(echo "$output") <(echo "$oracle"))

printf "$case===$reqmnt===$method===$args===$output===$oracle==="
# Previous output method
#printf "Test case: $case\n"
#printf "Method: $method\n"
#printf "Inputs: $args\n"
#printf "Output: $output\n"
#printf "Oracle: $oracle\n"

# Print whether it passes or fails
if [ "$result" != "" ]; then
    printf "fail"
else
    printf "pass"
fi

echo
