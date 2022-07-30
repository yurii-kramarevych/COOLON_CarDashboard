#include "rpm.h"
#include <thread>
#include <QKeyEvent>

Rpm::Rpm()
{
    std::thread([this](){

    std::this_thread::sleep_for(std::chrono::milliseconds(1000));

        while(1)
        {   double var {0};
            for(int i=0; i<=70; i++)
            {
                var = var + 0.1;
                if(var > 7.0) var = 7.0;
                setRpmValue(var);
            }

            for(int i=70; i>0; i--)
            {
                var = var - 0.1;
                if(var < 0) var = 0;
                setRpmValue(var);
            }
        };

    }).detach();

}

Rpm::~Rpm()
{

}

void Rpm::setRpmValue(double parameter)
{
    std::unique_lock lock{m};
    //qDebug()<<parameter;
    if( parameter != rpmValue)
    {
        //while(rpmValue <= parameter)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
            rpmValue = parameter;
            emit rpmValueChanged();

        }
        while(rpmValue > parameter)
        {
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
            rpmValue = rpmValue - 0.05;
            emit rpmValueChanged();

        }
    }
}

double Rpm::getRpmValue() const
{
    return rpmValue;
}

