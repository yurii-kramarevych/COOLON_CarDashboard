#pragma once

#include <QObject>
#include <QDebug>
#include <mutex>

class Speed : public QObject
{

    Q_OBJECT
    public:

    Q_PROPERTY(int speedValue READ getSpeedValue WRITE setSpeedValue NOTIFY speedValueChanged)

    Speed();
    ~Speed();

public slots:
    void setSpeedValue(int parameter);

    int getSpeedValue() const;

signals:
    void speedValueChanged();

private:
    int speedValue = 0;
    std::mutex m;
};
