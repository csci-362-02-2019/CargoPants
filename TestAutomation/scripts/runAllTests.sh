# Primary testing script.
# This script does multiple things:
# 1. calls the compileDrivers helper script
# 2. reads every test case into an array and
#    passes each case individually to
#    runSingleTest helper script

# Script will only run from the TestAutomation
#  directory. This helps keep things from
#  breaking in unexpected ways.
if [ ${PWD:len-14:14} != "TestAutomation" ]; then
    echo "Script must be run from root directory."
    exit
fi

# Compile drivers
bash ./scripts/compileDrivers.sh
echo

# Instantiate and run test cases
echo "Running test cases..."
ls ./testCases | while read -r file
do
    if [ $file != "testTemplate.txt" ]; then
        bash ./scripts/runSingleTest.sh $file
    fi
done

echo "Done."