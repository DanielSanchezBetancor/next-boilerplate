main() {
    print_colored_message "Starting to create components" green
    sh generator.sh $1 $2
    print_colored_message "Ended creating components" green
}
