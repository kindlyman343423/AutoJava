#!bin/bash

autojava()
{
    while inotifywait -q -e modify $1 >/dev/null; do
    
        str=$1
        strlen=${#str}
        strlen=$((strlen - 5))

        str=${str:0:strlen}

        if javac $1; then
            java $str
        fi

    done
}

if javac --version; then
    if [ -z "$1" ]; then
        echo "wrong arguments passed"
        echo "Try: bash autojava.bash filename.java"
    else
        str=$1
        strlen=${#str}
        newlen=$((strlen - 4))
        extension=${str:newlen:strlen}

        if [ "$extension" != "java" ]; then
            echo "wrong extension of the file"
            echo "Try: bash autojava.bash filename.java"
        else
            autojava $1
        fi
    fi

else
    echo "javac not found"
fi