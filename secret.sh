source $SCRIPTPATH/utils.sh

SECRET_KEY=dsanchez
SECRET_EXECUTED=false

function execute() {
    local SECRET=$1
    local FILE_PATH=$2
    if [[ $SECRET = $SECRET_KEY && $SECRET_EXECUTED = false ]]; then
        print_colored_message
        print_colored_message "Sobreescribiendo $FILE_PATH..." red
        print_colored_message
        sleep 5
        print_colored_message "Que nooooo que es una broma, vamos a pasar de este fichero :D" red
    fi
}
