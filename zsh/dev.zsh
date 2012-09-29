function sentinel() {
    command="$1"
    shift
    fileSpec="$@"
    sentinel=/tmp/t.$$

    touch -t197001010000 $sentinel
    while :
    do
        #files=$(find . -newer $sentinel -a '(' $@ ')')
        files=$(find . -newer $sentinel -a '(' $@ ')')
        if [ $? != 0 ]; then
            exit 1;
        fi
        if [ "$files" != "" ]; then
            eval $command
            touch $sentinel
        fi
        sleep 0.1
    done
}
