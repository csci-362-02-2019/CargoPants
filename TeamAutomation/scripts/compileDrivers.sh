echo "Compiling all drivers..."

cd ../project/src/

DRIVERS=./test/*

for driver in $DRIVERS
do
    echo $driver
    javac -d ../bin/ $driver
done
echo "done compiling"