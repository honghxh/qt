import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 800
    height: 480
    title: qsTr("Wearth")
    property int futureHour: 0
    property int futureWeather: 0
    property int mainWeather: 0

    Loader {
        id: weather_Main_loader
        anchors.fill: parent
        sourceComponent: weather_main
    }
    Component {
        id: weather_main
        WeatherMain {
            visible: mainWeather == 0 ? true : false
        }
    }
    Loader {
        id: weather_future_loader
        anchors.fill: parent
        sourceComponent: futureWeather == 1 ? weather_future : null
    }
    Component {
        id: weather_future
        FutureDay {
            visible: futureWeather == 1 ? true : false
        }
    }
    Loader {
        id: weather_day_loader
        anchors.fill: parent
        sourceComponent: futureHour == 1 ? weather_day : null
    }
    Component {
        id: weather_day
        FutureHour {
            visible: futureHour == 1 ? true : false
        }
    }

    DsmWeatherState {}
}
