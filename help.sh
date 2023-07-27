show_help() {
    print_colored_message "---------------" "green"
    print_colored_message "|     HELP    |" "green"
    print_colored_message "---------------" "green"
    print_colored_message "Create a component directory structure with the given name."
    print_colored_message
    print_colored_message "Usage:" "blue"
    print_colored_message "sh ./createComponent.sh [component_name]"
    print_colored_message
    print_colored_message "[component_name]: Must start with an uppercase letter"
    print_colored_message
    print_colored_message "Options:" "blue"
    print_colored_message
    print_colored_message "  -h, --help   Show this help message and exit."
}