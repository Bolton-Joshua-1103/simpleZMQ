#include <zmq.hpp>
#include <iostream>
#include <thread>
#include <chrono>
#include <string>

using namespace std;
using namespace std::chrono_literals;

static const std::string version = "v0.0.01";

int main() 
{
    std::cout << "Client " << version << " Starting..." << std::endl;

    zmq::context_t context(1);
    zmq::socket_t socket (context, zmq::socket_type::req);

    std::cout << "Connecting to hello world server..." << std::endl;
    socket.connect("tcp://localhost:5555");

    for(int request_nbr=1; request_nbr <= 10; request_nbr++)
    {
        zmq::message_t request(5);
        memcpy(request.data(), "Hello", 5);
        std::cout << "Sending Hello " << request_nbr << "...." << std::endl;
        socket.send(request, zmq::send_flags::none);
        
        zmq::message_t reply;
        socket.recv(reply, zmq::recv_flags::none);
        std::cout << "Received World " << request_nbr << std::endl;
        std::this_thread::sleep_for(500ms);
    }
    std::cout << "Client " << version << " Exiting..." << std::endl;
    return 0;
}