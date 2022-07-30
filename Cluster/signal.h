#pragma once

#include <QObject>
#include <QDebug>
#include <mutex>

class Signal : public QObject
{

    Q_OBJECT
    public:

    Q_PROPERTY(bool rightSig READ getRightSig WRITE setRightSig NOTIFY rightSigChanged)
    Q_PROPERTY(bool leftSig READ getLeftSig WRITE setLeftSig NOTIFY leftSigChanged)

    Signal();
    ~Signal();

public slots:
    void setRightSig(bool parameter);
    void setLeftSig(bool parameter);

    bool getRightSig() const;
    bool getLeftSig() const;

signals:
    void rightSigChanged();
    void leftSigChanged();

private:
    bool rightSig = false;
    bool leftSig = false;
    std::mutex m;
};
