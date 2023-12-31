source $SCRIPTPATH/secret_texts.sh

ERROR_UPPERCASE="Error: Component name must start with an uppercase letter."
CREATING_FOLDERS="Creating folders"
CREATE_FOLDER="    - Creating:"
ERROR_CREATE_FOLDER_1="    - Folder"
ERROR_CREATE_FOLDER_2="already exists, ignoring!"
CREATE_FILE="    - Creating"
ERROR_CREATE_FILE_1="    - File"
ERROR_CREATE_FILE_2="already exists, ignoring!"

if [[ $1 = $SECRET_KEY ]]; then
    ERROR_UPPERCASE="$SECRET_ERROR_UPPERCASE"
    CREATE_FOLDER="$SECRET_CREATING_FOLDER"
    ERROR_CREATE_FOLDER_1="$SECRET_ERROR_CREATE_FOLDER_1"
    ERROR_CREATE_FOLDER_2="$SECRET_ERROR_CREATE_FOLDER_2"
    CREATING_FOLDERS="$SECRET_CREATING_FOLDERS"
    CREATING_FILES="$SECRET_CREATING_FILES"
    ERROR_CREATE_FILE_1="$SECRET_ERROR_CREATE_FILE_1"
    ERROR_CREATE_FILE_2="$SECRET_ERROR_CREATE_FILE_2"
fi

function get_text() {
    local STR=$1
    local DYNAMIC=$2
    local EXTRA_STR=$3
    NEW_STR="$STR $DYNAMIC $EXTRA_STR"
    echo "$NEW_STR"
}
