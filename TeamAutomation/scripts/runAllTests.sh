#echo "This will remove the currently saved results. Continue? Y/N"
# Confirmation if/else should go here
#rm -r ../temp/*


TESTCASES=../testCases/*


for input in $TESTCASES
do
    CASE=$(sed '1!d' "$input")
    DRIVER=$(sed '4!d' "$input")
    ARGS=$(sed '5!d' "$input")
    ORACLE=$(sed '6!d' "$input")
    echo ${CASE:2}
    echo ${DRIVER:2}
    echo ${ARGS:2}
    echo ${ORACLE:2}
    echo
done

#cd ../project/src/
#javac -d ../bin/ test/Rgb2HexDriver.java
#cd ../bin/
#java test.Rgb2HexDriver > ../../temp/Test1Output.txt
#diff 