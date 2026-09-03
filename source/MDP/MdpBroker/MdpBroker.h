#include <iostream>
#include <memory>
#include <mutex>
#include <zmq.hpp>

class simpleBroker {
    public:
#pragma region Construction
        simpleBroker() { 
            std::cout << "Simple Broker Created" << std::endl;
        }
        bool Init() {
            if (active) return false;
            try {
                socketPtr.reset(std::make_unique<zmq::socket_t>(&socketContext, zmq::socket_type::router).get());
                socketPtr->bind(addr);
                active = true;
            }
            catch(zmq::error_t& zmqExc) {
                std::cout << "Exception thrown when initializing simpleBroker: " << zmqExc.what() << std::endl;
            }
            catch(...) {
                std::cout << "Unexpected exception thrown when initializing simpleBroker." << std::endl;
            }
            return active;
        }
        bool Valid() {return active && socketPtr.get() != nullptr;}
#pragma endRegion 

    private:

        bool write(std::string payload) {
            static zmq::send_flags flags{};
            zmq::message_t thePayload(payload);
            {
                std::lock_guard<std::mutex> writeLock(socketMutex);
                socketPtr->send(thePayload, flags);
            }
        }
        bool active = false;
        const char* addr = "tcp://127.0.0.1:5678";
        zmq::context_t socketContext;
        std::mutex socketMutex;
        std::unique_ptr<zmq::socket_t> socketPtr = nullptr;
};