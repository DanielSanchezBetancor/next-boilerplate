    NAME=$1
    X=$2
    source ./utils.sh
    source ./index.sh $NAME
    source ./component.sh $NAME
    source ./interface.sh $NAME
    source ./test.sh $NAME
    source ./mock.sh $NAME
    source ./insert.sh
    source ./texts.sh $X
    source ./secret.sh

    create_folder() {
        local FOLDER=$1
        local FOLDERNAME=$(basename "$FOLDER")

        LOCAL_CREATE_FOLDER=$(get_text "$CREATE_FOLDER" "$FOLDERNAME")
        ERROR_LOCAL_CREATE_FOLDER=$(get_text "$ERROR_CREATE_FOLDER_1" "$FOLDERNAME" "$ERROR_CREATE_FOLDER_2")

        if [ ! -d "$FOLDER" ]; then
            print_colored_message "$LOCAL_CREATE_FOLDER" blue
            print_colored_message "        - $FOLDER/" yellow
            mkdir $FOLDER
        else
            print_colored_message "$ERROR_LOCAL_CREATE_FOLDER" red
        fi
    }

    create_folders() {
        print_colored_message "$CREATING_FOLDERS" blue
        create_folder $NAME
        create_folder "$NAME/interfaces"
        create_folder "$NAME/mocks"
        create_folder "$NAME/components"
    }

    create_file() {
        local FILEPATH=$1
        local FILECONTENT=$2
        local FILENAME=$(basename "$FILEPATH")

        LOCAL_CREATE_FILE=$(get_text "$CREATE_FILE" "$FILENAME")
        ERROR_LOCAL_CREATE_FILE=$(get_text "$ERROR_CREATE_FILE_1" "$FILENAME" "$ERROR_CREATE_FILE_2")

        execute $X $FILEPATH

        if [ ! -f "$FILEPATH" ]; then
            print_colored_message "$LOCAL_CREATE_FILE" blue
            print_colored_message "        - $FILEPATH/" yellow
            echo "$FILECONTENT" >"$FILEPATH"
        else
            print_colored_message "$ERROR_LOCAL_CREATE_FILE " red
        fi
    }

    create_files() {
        print_colored_message "Creating code" blue
        create_file "$INDEX_PATH" "$INDEX_BOILERPLATE"
        create_file "$COMPONENT_PATH" "$COMPONENT_BOILERPLATE"
        create_file "$NAME/styles.module.scss" ""
        create_file "$NAME/interfaces/index.ts" "$INTERFACE_BOILERPLATE"
        create_file "$NAME/$NAME.test.tsx" "$TEST_BOILERPLATE"
        create_file "$NAME/mocks/__mock.ts" "$MOCK_BOILERPLATE"
    }

    create_folders
    create_files
