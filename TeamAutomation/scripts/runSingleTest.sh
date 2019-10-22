# Helper method that runs a single test case,
#  provided the test file as an argument.
#
# Two things to note about the script...
#  1. If Java produces an exception, the
#     exception will be printed to the
#     terminal it was run from, regardless
#     of if this output is being piped.
#  2. Should an exception happen, there will
#     be no $output variable, so bash will
#     also report that as an error in the
#     shell, even when piping.


# check if directory is valid
if [ ${PWD:len-10:10} != "CargoPants" ]; then
    echo "Script must be run from root directory."
    exit
fi

# check for argument
if [ $# -eq 0 ]; then
    echo "No arguments provided."
    exit
fi

# first argument is the input file
input=$1

# declare variables based on template
case=$(sed '1!d' "$input")
method=$(sed '4!d' "$input")
driver=$(sed '5!d' "$input")
args=$(sed '6!d' "$input")
oracle=$(sed '7!d' "$input")

# walk to bin/
cd ./TeamAutomation/project/bin/
    
# run driver and store result as variable
output=$(java "test.$driver" $args)
result=$(diff -q <(echo "$output") <(echo "$oracle"))

# Print outcome from driver
printf "Test case: $case\n"
printf "Method: $method\n"
#printf "java \"test.$driver\" $args\n" #debug
printf "Inputs: $args\n"
printf "Output: $output\n"
printf "Oracle: $oracle\n"

# Print whether it passes or fails
if [$result != ""]; then
    printf "Result? \e[1m\e[32mPass\e[39m\e[0m\n"
else
    printf "Result? \e[1m\e[31mFail\e[39m\e[0m\n"
fi

echo