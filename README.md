"Simple" ZMQ
========  
This is intended to be a library implementing the common ZMQ patterns found in the tutorial. Creating
'simple' classes that can be included in other projects to get some of the pattern headache out of the way.  

Currently this project is intended to be entirely academic.
----  

To build:  
run <REPO_ROOT>/scripts/buildAll.sh from anywhere  

Exectuables are test_server and test_client and should be found in <REPO_ROOT>/build

To run:  
Start server and client simultaneously with <REPO_ROOT>/scripts/startAll.sh
Kill with CTRL+C - server hangs on receive wait (WIP) 
