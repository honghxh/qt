#ifndef DSMTEST_H
#define DSMTEST_H
#include <QObject>
/******************************************************************************
 * @file       dsmtest.h
 * @description     header file
 * @author     hongxh<977609590@qq.com>
 * @date       2023/08/30
 *****************************************************************************/
class DsmTest: public QObject
{
    Q_OBJECT
public:
     explicit  DsmTest(QObject *parent = nullptr);
Q_INVOKABLE    void getSignal();
signals:
     void sendSignal();

};

#endif // DSMTEST_H
