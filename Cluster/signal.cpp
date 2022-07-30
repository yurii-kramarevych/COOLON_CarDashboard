#include "signal.h"
#include <thread>
#include <QKeyEvent>

Signal::Signal()
{
    std::thread([this](){

    std::this_thread::sleep_for(std::chrono::milliseconds(1000));

    bool val = false;
    for(;;)
    {
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));

        val = !val;
        setRightSig(val);
        setLeftSig(!val);
    }
    }).detach();

}

Signal::~Signal()
{

}

void Signal::setRightSig(bool parameter)
{
    std::unique_lock lock{m};
    rightSig = parameter;
    emit rightSigChanged();
}

void Signal::setLeftSig(bool parameter)
{
    std::unique_lock lock{m};
    leftSig = parameter;
    emit leftSigChanged();
}


bool Signal::getRightSig() const
{
    return rightSig;
}

bool Signal::getLeftSig() const
{
    return leftSig;
}

