#include <zmq.hpp>
#include <unistd.h>

#include <iostream>
#include <thread>
#include <chrono>
#include <string> 

using namespace std;
using namespace std::chrono_literals;

static const std::string version = "v0.0.01";

int main() 
{
    std::cout << "Server " << version << " Starting..." << std::endl;

    static const int kNumberOfThreads = 2;
    zmq::context_t context (kNumberOfThreads);
    zmq::socket_t socket (context, zmq::socket_type::rep);
    socket.bind("tcp://*:5555");
    auto totalTimeout = 10000ms;
    for(auto now = std::chrono::steady_clock::now(); chrono::duration<double, milli>(std::chrono::steady_clock::now() - now).count() < 10000;) {
        zmq::message_t request;

        auto result = socket.recv(request, zmq::recv_flags::none); //Blocking - might have to kill this process for now
        if(result.value_or(0) != 0) { std::cout << "Non-zero length message received" << std::endl;}
        std::cout << "Received Hello" << std::endl;

        std::this_thread::sleep_for(200ms);

        constexpr std::string_view kReplyString = "World";
        zmq::message_t reply (kReplyString.length());
        memcpy(reply.data(), kReplyString.data(), kReplyString.length());
        socket.send(reply, zmq::send_flags::none);
    }
    std::cout << "Server " << version << " Exiting..." << std::endl;
    return 0;
}