# This bash script is designed to run a single
# test case, provided the test file as a parameter.


# make sure the script is being run properly
if [ ${PWD:len-10:10} != "CargoPants" ]; then
    echo "Script must be run from root directory."
    exit
fi
if [ $# -eq 0 ]; then
    echo "No arguments provided."
    exit
fi

# first argument is the input file
input=$1

# declare variables based on template
CASE=$(sed '1!d' "$input")
DRIVER=$(sed '5!d' "$input")
ARGS=$(sed '6!d' "$input")
ORACLE=$(sed '7!d' "$input")

# walk to bin/
cd ./TeamAutomation/project/bin/
    

# run driver
printf "Test case: ${CASE}\n"
#printf "java \"test.${DRIVER}\" ${ARGS}\n" #debug
printf "Result: "
java "test.${DRIVER}" ${ARGS}
printf "Oracle: ${ORACLE}\n"
    
echo