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

# Make the temp output
mkdir temp
touch ./temp/testResults.html

# Delimeter (used to split test output into variable)
del="==="

# output file
rm ./temp/output.txt
touch ./temp/output.txt
outFile=./temp/output.txt

# Instantiate and run test cases
echo "Running test cases..."
ls ./testCases | while read -r file
do
    if [ $file != "testTemplate.txt" ]; then
        temp=$(bash ./scripts/runSingleTest.sh $file)
        if [[ $temp =~ (.*)$del(.*)$del(.*)$del(.*)$del(.*)$del(.*) ]]; then
            #echo $BASH_REMATCH
            #echo ${BASH_REMATCH[0]}
            echo ${BASH_REMATCH[1]} >> "$outFile"
            echo ${BASH_REMATCH[2]} >> "$outFile"
            echo ${BASH_REMATCH[3]} >> "$outFile"
            echo ${BASH_REMATCH[4]} >> "$outFile"
            echo ${BASH_REMATCH[5]} >> "$outFile"
            echo ${BASH_REMATCH[6]} >> "$outFile"

        fi
        #echo $temp
    fi
done

echo "Done."