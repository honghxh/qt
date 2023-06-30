#ifndef WEATHERCONFIGURE_H
#define WEATHERCONFIGURE_H

#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>
#include <QtCore/QObject>
#include <QtCore/QString>
#include <QtCore/QByteArray>
#include <QtCore/QDebug>
#include <QJsonObject>
class WeatherConfigure : public QObject
{
    Q_OBJECT
public:
    explicit WeatherConfigure(QObject *parent = nullptr);
    //存放所有结果的json数据,保存在类中
    Q_INVOKABLE QJsonObject WeatherJsonObject;
    Q_INVOKABLE void getWeatherJson();
    Q_INVOKABLE void getWeather(const QString cityName);
signals:
    void weatherResponse(const QString value);
    void responseResult(const QJsonObject value);
    void responseRealTime(const QJsonObject value);
private slots:
    void onRequestFinished();

private:
    QNetworkAccessManager *manager;
    QNetworkRequest *request;
    QNetworkReply *reply;
};

#endif // WEATHERCONFIGURE_H
