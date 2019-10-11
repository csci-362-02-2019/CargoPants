#echo "This will remove the currently saved results. Continue? Y/N"
# Confirmation if/else should go here
#rm -r ../temp/*

bash compileDrivers.sh
echo

TESTCASES=../testCases/*

for input in $TESTCASES
do
    if [ $input != "../testCases/testTemplate.txt" ]; then
        CASE=$(sed '1!d' "$input")
        DRIVER=$(sed '4!d' "$input")
        ARGS=$(sed '5!d' "$input")
        ORACLE=$(sed '6!d' "$input")
        echo ${CASE}
        echo ${DRIVER}
        echo ${ARGS}
        echo ${ORACLE}
        echo
    fi
done

#cd ../project/src/
#javac -d ../bin/ test/Rgb2HexDriver.java
#cd ../bin/
#java test.Rgb2HexDriver > ../../temp/Test1Output.txt
#diff 