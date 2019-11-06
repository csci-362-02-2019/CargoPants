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

# Delimeter (used to split test output into variable)
del="==="

# template file
template=./scripts/template/template.html

# Reset and make output file
mkdir temp
outFile=./temp/testResults.html
rm $outFile
touch $outFile

# Append heading of template file to output
for i in {1..45}; do
    sed "$i!d" $template >> $outFile
done

# Add date and time
if [[ $(sed "46!d" $template) =~ ^(.*)\{time\}(.*)$ ]]; then   
    #echo $BASH_REMATCH
    echo "${BASH_REMATCH[1]}$(date)${BASH_REMATCH[2]}" >> $outFile
fi

# Append next section of template
for i in {47..55}; do
    sed "$i!d" $template >> $outFile
done

# Instantiate and run test cases
echo "Running test cases..."
ls ./testCases | while read -r file
do
    if [ $file != "testTemplate.txt" ]; then
        temp=$(bash ./scripts/runSingleTest.sh $file)
        #echo $temp

        # Capture variables from runSingleTest
        if [[ $temp =~ (.*)$del(.*)$del(.*)$del(.*)$del(.*)$del(.*) ]]; then
            #echo ${BASH_REMATCH[0]}

            tcase=${BASH_REMATCH[1]} 
            method=${BASH_REMATCH[2]}
            inputs=${BASH_REMATCH[3]}
            output=${BASH_REMATCH[4]}
            oracle=${BASH_REMATCH[5]}
            result=${BASH_REMATCH[6]}
        fi

        # Get Class.method from full path
        if [[ "$method" =~ \.([a-zA-Z0-9]+\.[a-zA-Z0-9]+\(\))$ ]]; then
            echo ${BASH_REMATCH[0]}
            method=${BASH_REMATCH[1]}
        fi

        # append row start
        sed "56!d" $template >> $outFile

        # Append test cases to output
        if [[ $(sed "57!d" $template) =~ ^(.*)\{case\}(.*)$ ]]; then
            echo "${BASH_REMATCH[1]}$tcase${BASH_REMATCH[2]}" >> "$outFile"
        fi
        if [[ $(sed "58!d" $template) =~ ^(.*)\{method\}(.*)$ ]]; then
            echo "${BASH_REMATCH[1]}$method${BASH_REMATCH[2]}" >> "$outFile"
        fi
        if [[ $(sed "59!d" $template) =~ ^(.*)\{inputs\}(.*)$ ]]; then
            echo "${BASH_REMATCH[1]}$inputs${BASH_REMATCH[2]}" >> "$outFile"
        fi
        if [[ $(sed "60!d" $template) =~ ^(.*)\{output\}(.*)$ ]]; then
            echo "${BASH_REMATCH[1]}$output${BASH_REMATCH[2]}" >> "$outFile"
        fi
        if [[ $(sed "61!d" $template) =~ ^(.*)\{oracle\}(.*)$ ]]; then
            echo "${BASH_REMATCH[1]}$oracle${BASH_REMATCH[2]}" >> "$outFile"
        fi
        if [[ $(sed "62!d" $template) =~ ^(.*)\{pf\}(.*)\{result\}(.*)$ ]]; then
            echo "${BASH_REMATCH[1]}$result${BASH_REMATCH[2]}$result${BASH_REMATCH[3]}" >> "$outFile"
        fi

        # append row end
        sed "63!d" $template >> $outFile
    fi
done

# Append end of template
for i in {64..66}; do
    sed "$i!d" $template >> $outFile
done

echo "Done."
xdg-open $outFile