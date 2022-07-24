#include "speed.h"
#include <thread>

Speed::Speed()
{
    std::thread([this](){

    std::this_thread::sleep_for(std::chrono::milliseconds(1000));

    for(int i=0; i<=260; i++)
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(100));

        setSpeedValue(i);
    }

    for(int i=260; i>=0; i--)
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(100));

        setSpeedValue(i);
    }

    }).detach();
}

Speed::~Speed()
{

}

void Speed::setSpeedValue(int parameter)
{
    speedValue = parameter;
    emit speedValueChanged();
}

int Speed::getSpeedValue() const
{
    return speedValue;
}

