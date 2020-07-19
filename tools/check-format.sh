#!/bin/bash

SOURCES=src
EXTENSIONS="cpp|cxx|cc|c++|hpp|hxx|hh|h|h++"

CUR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $CUR_DIR/..

FIX='false'

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            echo "Finds all C++ files in src folder and checks format with clang-format."
            echo "If code has wrong format, prints diff and returns a total number of invalid files."
            echo "Uses config file .clang-format"
            echo ""
            echo "Options:"
            echo "  -f, --fix     Fix all the files"
            exit 0
            ;;
        -f|--fix)
            FIX='true'
            shift
            ;;
        *)
            break
            ;;
    esac
done

INVALID=0
FILES=0

for FILE in `find $SOURCES -regextype posix-extended -regex ".*\.($EXTENSIONS)"`; do
    DIFF=`diff --color=always $FILE <(clang-format -style=file $FILE)`
    if [ $? -ne 0 ] ; then
        [ $FIX = 'true' ] && clang-format -i -style=file $FILE
        echo -n "Invalid file: $FILE "
        echo "$DIFF"
        echo ""
        INVALID=$((INVALID + 1))
    fi
    FILES=$((FILES + 1))
done

echo "$FILES files are checked"
if [ $INVALID -ne 0 ] ; then
    echo "$INVALID files with format errors"
    [ $FIX = 'true' ] && echo "All files are fixed"
else
    echo "No format errors"
fi

exit $INVALID
