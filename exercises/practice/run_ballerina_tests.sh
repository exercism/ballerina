#!/bin/bash

for dir in ./*/
do
    dir=${dir%*/}
    test_name=${dir##*/}
    echo "================================"
    echo "Executing : $test_name"

    if [ -d temp_test ]; then
        echo "Cleaning temp files..."
        rm -r temp_test
    fi

    mkdir temp_test
    cp -r $test_name ./temp_test
    rm -r ./temp_test/$test_name/.meta
    cp -r $test_name/.meta/reference/* ./temp_test/$test_name
    cd ./temp_test
    bal init
    bal test --offline
    cd ..
    rm -r temp_test
    echo "================================"

done
