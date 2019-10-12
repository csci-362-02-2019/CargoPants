# Helper script that compiles all drivers
# Script assumes all drivers are in src/test/

if [ ${PWD:len-10:10} != "CargoPants" ]; then
    echo "Script must be run from root directory."
    exit
fi

echo "Recompiling all drivers..."

cd TeamAutomation/project/src/

DRIVERS=./test/*

for driver in $DRIVERS
do
    echo $driver
    javac -d ../bin/ $driver
done
echo "done compiling"