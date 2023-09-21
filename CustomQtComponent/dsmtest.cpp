#include "dsmtest.h"
#include <QDebug>
/******************************************************************************
 * @file       dsmtest.cpp
 * @description
 * @author     hongxh<977609590@qq.com>
 * @date       2023/08/30
 *****************************************************************************/
DsmTest::DsmTest(QObject *parent) : QObject(parent)
{

}

void DsmTest::getSignal(){
    emit sendSignal();
}
