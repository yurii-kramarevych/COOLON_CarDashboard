#pragma once

#include <QObject>
#include <QDebug>
#include <mutex>

class Rpm : public QObject
{

    Q_OBJECT
    public:

    Q_PROPERTY(double rpmValue READ getRpmValue WRITE setRpmValue NOTIFY rpmValueChanged)

    Rpm();
    ~Rpm();

public slots:
    void setRpmValue(double parameter);

    double getRpmValue() const;

signals:
    void rpmValueChanged();

private:
    double rpmValue = 0;
    std::mutex m;
};
