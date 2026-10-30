#!/bin/bash
# menu.sh - Interactive utility menu
while true; do
    echo "====================================="
    echo "         PRACTICAL MENU SCRIPT       "
    echo "====================================="
    echo "1. Greet the user"
    echo "2. Add two integers"
    echo "3. Check even or odd"
    echo "4. Exit"
    echo "====================================="
    echo -n "Enter your choice [1-4]: "
    read choice
    case $choice in
        1)
            echo -n "Enter your name: "
            read user_name
            echo "Hello, $user_name! Have a great lab session."
            ;;
        2)
            echo -n "Enter first integer: "
            read num1
            echo -n "Enter second integer: "
            read num2
            sum=$((num1 + num2))
            echo "Result: $num1 + $num2 = $sum"
            ;;
        3)
            echo -n "Enter an integer: "
            read num
            if [ $((num % 2)) -eq 0 ]; then
                echo "Result: $num is EVEN."
            else
                echo "Result: $num is ODD."
            fi
            ;;
        4)
            echo "Exiting menu. Goodbye!"
            break
            ;;
        *)
            echo "Invalid option. Please select 1-4."
            ;;
    esac
    echo ""
done
