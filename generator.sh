source $SCRIPTPATH/utils.sh
source $SCRIPTPATH/index.sh
source $SCRIPTPATH/component.sh
source $SCRIPTPATH/interface.sh
source $SCRIPTPATH/test.sh
source $SCRIPTPATH/mock.sh
source $SCRIPTPATH/insert.sh
source $SCRIPTPATH/texts.sh
source $SCRIPTPATH/secret.sh
source $SCRIPTPATH/hook.sh
source $SCRIPTPATH/test_hook.sh

create_folder() {
    local FOLDER=$1
    local FOLDERNAME=$(basename "$FOLDER")

    LOCAL_CREATE_FOLDER=$(get_text "$CREATE_FOLDER" "$FOLDERNAME")
    ERROR_LOCAL_CREATE_FOLDER=$(get_text "$ERROR_CREATE_FOLDER_1" "$FOLDERNAME" "$ERROR_CREATE_FOLDER_2")

    if [ ! -d "$FOLDER" ]; then
        print_colored_message "$LOCAL_CREATE_FOLDER" blue
        print_colored_message "        - $FOLDER/" yellow
        mkdir -p $USERPATH/$FOLDER
    else
        print_colored_message "$ERROR_LOCAL_CREATE_FOLDER" red
    fi
}

create_folders() {
    print_colored_message "$CREATING_FOLDERS" blue
    create_folder $SELECTED_USERNAME
    create_folder "$SELECTED_USERNAME/interfaces"
    create_folder "$SELECTED_USERNAME/mocks"
    create_folder "$SELECTED_USERNAME/components"
    create_folder "$SELECTED_USERNAME/hooks"
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
        echo "$FILECONTENT" >"$USERPATH/$FILEPATH"
    else
        print_colored_message "$ERROR_LOCAL_CREATE_FILE " red
    fi
}

create_files() {
    print_colored_message "Creating code" blue
    local FILENAME=$(basename "$SELECTED_USERNAME")
    create_file "$INDEX_PATH" "$INDEX_BOILERPLATE"
    create_file "$COMPONENT_PATH" "$COMPONENT_CODE"
    create_file "$SELECTED_USERNAME/styles.module.scss" ""
    create_file "$SELECTED_USERNAME/interfaces/index.ts" "$INTERFACE_BOILERPLATE"
    create_file "$SELECTED_USERNAME/$FILENAME.test.tsx" "$TEST_BOILERPLATE"
    create_file "$SELECTED_USERNAME/mocks/__mock.ts" "$MOCK_BOILERPLATE"
    create_file "$HOOK_PATH" "$HOOK_CODE"
    create_file "$TEST_HOOK_PATH" "$TEST_HOOK_CODE"
}

generate_files() {
    create_folders
    create_files
}
