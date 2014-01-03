VHDL Experiments
================
Experiments in VHDL created a while back. Built with GHDL. [Tutorials](http://www.youtube.com/user/edybond2) courtesy of Altera via edybond2. No longer have the test cases.

To Install GHDL on a Debian-based System
----------------------------------------
1. add package archives - sudo add-apt-repository ppa:pgavin/ghdl
2. update - sudo apt-get update
3. install - sudo apt-get install ghdl

To Run
------
1. analyze - ghdl -a project.vhdl
2. elaborate - ghdl -e entity_name
3. execute - ./entity_name

To Clean
--------
* make clean
