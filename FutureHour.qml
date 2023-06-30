import QtQuick 2.0
import QtQuick.Controls 2.12

Item {

    width: 800
    property var dateYmdh: ""
    property var weatherstate: ""

    Image {
        id: image
        x: 0
        y: 0
        width: 800
        height: 480
        fillMode: Image.Stretch
        source: "qrc:/C:/Users/Dell/Pictures/Saved Pictures/wearther/R-C.jpg"

        //        Image {
        //            id: image2
        //            x: 14
        //            y: 61
        //            width: 135
        //            height: 108
        //            source: "qrc:/C:/Users/Dell/Pictures/Saved Pictures/wearther/%1.png".arg(
        //                        weatherstate)
        //            fillMode: Image.PreserveAspectFit
        //        }
    }
    Label {
        id: date
        x: 24
        y: 19
        width: 118
        height: 36
        color: "#f4f6f5"
        text: dateYmdh
        font.bold: true
        font.pointSize: 18
    }
    Button {
        x: 731
        y: 432
        width: 61
        height: 40
        text: "back"
        onClicked: {
            mainWeather = 0
            futureHour = 0
        }
    }
    function storeWeatherData1(jsonObject) {
        dateYmdh = jsonObject.futureHour[0].dateYmdh
    }
    Connections {
        target: weather
        onResponseResult: {
            storeWeatherData1(value)
        }
    }
}
