#!/bin/bash
source ./utils.sh $2
source ./help.sh
source ./main.sh


if [[ $1 = '' || $1 = '-h' || $1 = '--help' ]]; then
    show_help
    exit 1
else
    validate_component_name $1
    main $1 $2
    exit 0
fi
