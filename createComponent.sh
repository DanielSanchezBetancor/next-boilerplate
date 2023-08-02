#!/bin/bash
SELECTED_USERNAME=$1
X=$2

# Grabbing user path to create the files
USERPATH=$(pwd)
echo $USERPATH
FULLSCRIPTPATH="${BASH_SOURCE[0]}"
SCRIPTPATH=$(dirname "$FULLSCRIPTPATH")

source $SCRIPTPATH/utils.sh
source $SCRIPTPATH/help.sh
source $SCRIPTPATH/main.sh

if [[ $SELECTED_USERNAME = '' || $SELECTED_USERNAME = '-h' || $SELECTED_USERNAME = '--help' ]]; then
    show_help
    exit 1
else
    validate_component_name
    main
    exit 0
fi
