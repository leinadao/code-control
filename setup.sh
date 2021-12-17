#!/bin/bash
function check_repo_location {
    REPO_DIR_EXP="$HOME/code_control"
    SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
    echo "Script located at: $SCRIPT_DIR"
    if [[ "$SCRIPT_DIR" != "$REPO_DIR_EXP" ]]; then
        echo "ERROR: This repo should be located at $REPO_DIR_EXP. Please move it and try again."
        CMD_SUG="mv $SCRIPT_DIR $REPO_DIR_EXP"
        if [[ "$PWD" == "$SCRIPT_DIR"* ]]; then
            extra_path="${PWD/"$SCRIPT_DIR"}"
            extra_slashes="${extra_path//[^\/]}"
            num_extra_levels=${#extra_slashes}
            for (( i=$num_extra_levels+1; i>0; i-- ))
            do
                CMD_SUG="cd .. && $CMD_SUG"
            done
        fi
        echo "e.g. run: $CMD_SUG"
        exit 1
    fi
    echo "Repo correctly located..."
}

main() {
    check_repo_location
}

## Main entry point:
main
