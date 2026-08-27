THIS IS A TEMPLATE REPO
========  
This template repo uses cmake, vcpkg, build script, runscripts and should all be self contained to compile right from a debian/ubuntu based clone. It has the most basic example of the zeromq client/server from the official guide. It is meant to be used as a starting point for projects that use Cmake and/or vcpkg and/or zeromq.  
----  

To build:  
run <REPO_ROOT>/scripts/buildAll.sh from anywhere  

Exectuables are test_server and test_client and should be found in <REPO_ROOT>/build

To run:  
Start server and client simultaneously with <REPO_ROOT>/scripts/startAll.sh
Kill with CTRL+C - server hangs on receive wait (WIP) 
