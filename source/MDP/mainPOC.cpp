#include <iostream>

#include "MdpBroker/MdpBroker.h"

using namespace std;

int main() {
    std::cout << "======= BEGIN MDP TEST APP =======" << std::endl;
    simpleBroker my_broker;
    my_broker.Init();
        

    std::cout << "======= END MDP TEST APP =======" << std::endl;
}