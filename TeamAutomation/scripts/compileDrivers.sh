# Helper script that compiles all drivers
# Script assumes all drivers are in src/test/

# check if directory is valid
if [ ${PWD:len-10:10} != "CargoPants" ]; then
    echo "Script must be run from root directory."
    exit
fi

# make a new bin/ directory if it doesn't exist
# (prevents "directory not found" error)
# For some reason this executes every time, but I've
#  tested this outside the script and it worked just
#  fine, so I'm not sure what the issue is.
# Regardless, bash just states that the directory
#  already exists when it tries to remake it.
if [ ! -d ./TeamAutopmation/project/bin ]; then
    echo "Compiling all drivers..."
    mkdir ./TeamAutomation/project/bin
else
    echo "Recompiling all drivers..."
fi

# walk to source root directory
cd TeamAutomation/project/src/

# declare driver files
DRIVERS=./test/*

# compile each driver in ../bin/
for driver in $DRIVERS
do
    echo $driver
    javac -d ../bin/ $driver
done

echo "done compiling"
