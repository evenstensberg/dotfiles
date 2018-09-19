# test a test suite against a specific string
# useful for regression error testing or smoketesting

# Used here: https://github.com/nasa/openmct/issues/1865


trap "exit 9" TERM
TOP_PID=$$

PidName=`pidof chrome`

found=false

cd /Your/Path

function rl() {
    while IFS= read -r line
    do
    substr="Searching for this"
    if [[ $line == *"$substr"*]]; then
        echo "$line"
        found=true
    elif [[ "$found" = true]]; then
        echo "$line"
    fi
    done
}

function run() {
    if [[ "$found" = true]] then
        clear
        npm run test | rl && run
    fi
}

npm run test | rl && run