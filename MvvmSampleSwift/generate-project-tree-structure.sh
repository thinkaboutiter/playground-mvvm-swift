#!/bin/bash

function draw_ui_start() {
    echo
    echo "---"
    # log the name of the program
    echo "Executing ${0}"
    echo "---"
}

function draw_ui_end() {
    echo "---"
    echo
    exit 0
}

draw_ui_start

function draw_ui_execute() {
    echo
    read -p "This will create project structure folders in current directory. Continue? (y/n) " SHOULD_EXECUTE

    case "$SHOULD_EXECUTE" in
    [yY]|[1]|[yY][eE][sS] )
        echo 
        ;;
    [nN]|[nN][oO])
        draw_ui_end
        ;;
    *)
        draw_ui_execute
        ;;
    esac
}

draw_ui_execute

echo "Enter root folder name"
read -p "ROOT_NAME=" ROOT_NAME
echo

if [[ -d "${ROOT_NAME}" ]]; then
    echo "Folder with name ${ROOT_NAME} eixts!"
    echo "Aborting..."
    exit 1
fi

mkdir ${ROOT_NAME}
mkdir "${ROOT_NAME}/DataLayer"
mkdir "${ROOT_NAME}/DataLayer/Repositories"
mkdir "${ROOT_NAME}/DataLayer/Repositories/Network"
mkdir "${ROOT_NAME}/DataLayer/Repositories/Persistence"
mkdir "${ROOT_NAME}/DataLayer/Model"
mkdir "${ROOT_NAME}/Extensions"
mkdir "${ROOT_NAME}/Managers"
mkdir "${ROOT_NAME}/UILayer"
mkdir "${ROOT_NAME}/UILayer/_UIBaseClasses"
mkdir "${ROOT_NAME}/UILayer/Screens"
mkdir "${ROOT_NAME}/UILayer/Screens/Initial"
mkdir "${ROOT_NAME}/UILayer/Screens/Initial/View"
mkdir "${ROOT_NAME}/UILayer/Screens/Initial/ViewModel"
mkdir "${ROOT_NAME}/Utilities"


echo "Structure created under \"${ROOT_NAME}\" folder"
draw_ui_end
