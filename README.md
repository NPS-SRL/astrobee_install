# Astrobee install scripts

These scripts are used at NPS to install and update [NASA's Astrobee simulator](https://github.com/nasa/astrobee) based on its [installation guide](https://github.com/nasa/astrobee/blob/master/INSTALL.md).

Installing the Astrobee Simulator
---------------------------------

To install the Astrobee Simulator just execute the `Astrobee_install.sh`:

    ./Astrobee_install.sh


After the install the `freeflyer`, `freeflyer_build`, `freeflyer_install`, and `freeflyer_android` will be located in `~/Documents`.

Launching a simulation
----------------------

First, source `freeflyer`,

    source ~/Documents/freeflyer_build/native/devel/setup.bash

and then launch the simulator

	roslaunch astrobee sim.launch dds:=false robot:=sim_pub rviz:=true sviz:=true


Updating the Astrobee Simulator
-------------------------------

When the [NASA's Astrobee simulator](https://github.com/nasa/astrobee) repository is updated you can run the update script to update your local copy of the simulator (it simply pulls the changes and re-compiles).

    ./Astrobee_update.sh













	
