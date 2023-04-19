#!/bin/bash

# Usage:
#   cd ./exercises/practice
#   ./run_ballerina_tests.sh        # test all exercises
#   ./run_ballerina_tests.sh sieve  # test one exercise

shopt -s nullglob
cd "$(dirname "$0")"

test_exercise() {
    local dir=${1%/}
    local exercise=./${dir##*/}

    echo "================================"
    echo "Executing : ${exercise#./}"

    mkdir -p temp_test
    find temp_test -type f -delete

    cp $exercise/*.{bal,toml} temp_test
    (cd "$exercise" && tar cf - ./tests) | (cd temp_test && tar xf -)
    cp -r $exercise/.meta/reference/* temp_test

    cd ./temp_test
    bal test --offline || ((++exit_status))

    cd ..
    rm -r temp_test
    echo "================================"
}

main() {
    [[ -d temp_test ]] && rm -r temp_test
    exit_status=0

    if (( $# == 0 )); then
        for dir in ./*/; do
            test_exercise "$dir"
        done
    elif [[ ! -d "$1" ]]; then
        echo "error: no such directory '$1'" >&2
        exit_status=1
    else
        test_exercise "$1"
    fi

    #exit $exit_status
    echo "$exit_status exercises have unsuccessful tests"
    return 0
}

main "$@"
