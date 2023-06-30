#include "weatherconfigure.h"
#include <QJsonObject>
#include <QJsonDocument>
WeatherConfigure::WeatherConfigure(QObject *parent) : QObject(parent)
{
    manager = new QNetworkAccessManager(this);
    request = new QNetworkRequest();
}
void WeatherConfigure::getWeatherJson(){
    emit responseResult(WeatherJsonObject);
}
void WeatherConfigure::getWeather(const QString cityName)
{
    QString url = QString("http://api.k780.com/?app=weather.realtime&cityNm=") + cityName +
                  QString("&ag=today,futureDay,lifeIndex,futureHour&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json");
    request->setUrl(QUrl(url));

    reply = manager->get(*request);

    QObject::connect(reply, &QNetworkReply::finished, this, &WeatherConfigure::onRequestFinished);
}

void WeatherConfigure::onRequestFinished()
{
    if (reply->error() == QNetworkReply::NoError) {
        QByteArray response = reply->readAll();
        QString responseStr = QString::fromUtf8(response);

        // 转换为JSON格式
        QJsonDocument jsonResponse = QJsonDocument::fromJson(response);
        if (!jsonResponse.isNull()) {
            if (jsonResponse.isObject()) {
                QJsonObject jsonObject = jsonResponse.object();
                WeatherJsonObject = jsonObject;
                QString success = jsonObject["success"].toString();
                //输出接口请求信号"1"
                 qDebug() << success;
                 QJsonObject resultObject = jsonObject["result"].toObject();
                 WeatherJsonObject = resultObject;
                 emit responseResult(resultObject);
            }
        } else {
            qDebug() << "Invalid JSON response";
        }
    } else {
        qDebug() << "Error: " << reply->errorString();
    }

    //reply->deleteLater();
}
