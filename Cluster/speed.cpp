#include "speed.h"
#include <thread>
#include <QKeyEvent>

Speed::Speed()
{
    std::thread([this](){

    std::this_thread::sleep_for(std::chrono::milliseconds(1000));

        while(1)
        {
            for(int i=0; i<=260; i++)
            {
                setSpeedValue(i);
            }

            for(int i=260; i>=0; i--)
            {
                setSpeedValue(i);
            }
        };

    }).detach();

}

Speed::~Speed()
{

}

void Speed::setSpeedValue(int parameter)
{
    std::unique_lock lock{m};
    if( parameter != speedValue)
    {
        while(speedValue <= parameter)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(10));
            speedValue++;
            emit speedValueChanged();

        }
        while(speedValue > parameter)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(10));
            speedValue--;
            emit speedValueChanged();

        }
    }
}

int Speed::getSpeedValue() const
{
    return speedValue;
}

