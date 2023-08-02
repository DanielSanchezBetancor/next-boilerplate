source $SCRIPTPATH/texts.sh $SCRIPTPATH $2

print_colored_message() {
    local message=$1
    local color=$2

    case $color in
        "red")
            echo -e "\e[1;31m$message\e[0m"  # Texto en rojo
            ;;
        "green")
            echo -e "\e[1;32m$message\e[0m"  # Texto en verde
            ;;
        "blue")
            echo -e "\e[1;34m$message\e[0m"  # Texto en azul
            ;;
        "yellow")
            echo -e "\e[1;33m$message\e[0m"  # Texto en amarillo
            ;;
        "purple")
            echo -e "\e[1;35m$message\e[0m"  # Texto en morado
            ;;
        *)
            echo -e "$message"
            ;;
    esac
}

validate_component_name() {
    local first_char=${SELECTED_USERNAME:0:1}

    if [[ ! "$first_char" =~ [[:upper:]] ]]; then
        print_colored_message "$ERROR_UPPERCASE" "red"
        exit 1
    fi
}