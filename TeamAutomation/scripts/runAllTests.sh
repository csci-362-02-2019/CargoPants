# Primary testing script.
# This script does multiple things:
# 1. calls the compileDrivers helper script
# 2. reads every test case into an array and
#    passes each case individually to
#    runSingleTest helper script

# Script will only run from root directory.
# This helps keep things from breaking
#  in unexpected ways.
if [ ${PWD:len-10:10} != "CargoPants" ]; then
    echo "Script must be run from root directory."
    exit
fi

# Compile drivers
bash ./TeamAutomation/scripts/compileDrivers.sh
echo

# Instantiate and run test cases
echo "Running test cases..."
TESTCASES=./TeamAutomation/testCases/*
for input in $TESTCASES
do
    if [ $input != "./TeamAutomation/testCases/testTemplate.txt" ]; then
        bash ./TeamAutomation/scripts/runSingleTest.sh $input
    fi
done

echo "Done."