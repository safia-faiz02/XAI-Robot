#! /bin/bash

function maybe_compile() {
    echo -e "[$(date +'%T utc')] 🔵  Compiling ~/ros2_ws ..."

    if [ -e  ~/ros2_ws/install/.built_by_theconstruct ]; then
        echo "  Compilation not needed. Skipping..."
        return
    fi

    cd ~/ros2_ws && colcon build --symlink-install && touch ~/ros2_ws/install/.built_by_theconstruct
}

function launch_sim() {
    echo -e "[$(date +'%T utc')] 🔵  Launching simulation ... \n"

    source ~/ros2_ws/install/setup.bash
    ros2 launch robot_description launch_sim.launch.py
}


function main() {
    maybe_compile
    launch_sim
}

main