# Script will only run from root directory.
# This will help keep things from
#  breaking in unexpected ways.
if [ ${PWD:len-10:10} != "CargoPants" ]; then
    echo "Script must be run from root directory."
    exit
fi

bash ./TeamAutomation/scripts/compileDrivers.sh
echo

TESTCASES=./TeamAutomation/testCases/*

for input in $TESTCASES
do
    if [ $input != "./TeamAutomation/testCases/testTemplate.txt" ]; then
        bash ./TeamAutomation/scripts/runSingleTest.sh $input
    fi
done

echo "Done running tests."