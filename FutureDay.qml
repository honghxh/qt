import QtQuick 2.0
import QtQuick.Controls 2.12

Item {

    width: 800
    property var week1: "test"
    property var week2: "test"
    property var week3: "test"
    property var week4: "test"
    property var week5: "test"
    property var weatherstate: ""
    property var weatherstate1: ""
    property var weatherstate2: ""
    property var weatherstate3: ""
    property var weatherstate4: ""

    Image {
        id: image
        x: 0
        y: 0
        width: 800
        height: 480
        fillMode: Image.Stretch
        source: "qrc:/C:/Users/Dell/Pictures/Saved Pictures/wearther/FutureBackground.jpg"
    }
    Image {
        id: image1
        x: 19
        y: 71
        width: 93
        height: 87
        source: "qrc:/C:/Users/Dell/Pictures/Saved Pictures/wearther/%1.png".arg(
                    weatherstate)
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: image2
        x: 216
        y: 71
        width: 93
        height: 87
        source: "qrc:/C:/Users/Dell/Pictures/Saved Pictures/wearther/%1.png".arg(
                    weatherstate1)
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: image3
        x: 360
        y: 71
        width: 93
        height: 87
        source: "qrc:/C:/Users/Dell/Pictures/Saved Pictures/wearther/%1.png".arg(
                    weatherstate2)
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: image4
        x: 520
        y: 71
        width: 93
        height: 87
        source: "qrc:/C:/Users/Dell/Pictures/Saved Pictures/wearther/%1.png".arg(
                    weatherstate3)
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: image5
        x: 685
        y: 71
        width: 93
        height: 87
        source: "qrc:/C:/Users/Dell/Pictures/Saved Pictures/wearther/%1.png".arg(
                    weatherstate4)
        fillMode: Image.PreserveAspectFit
    }
    Label {
        id: week_1
        x: 32
        y: 35
        width: 118
        height: 36
        color: "#f4f6f5"
        text: week1
        font.bold: true
        font.pointSize: 18
    }
    Label {
        id: week_2
        x: 217
        y: 35
        width: 118
        height: 36
        color: "#f4f6f5"
        text: week2
        font.bold: true
        font.pointSize: 18
    }
    Label {
        id: week_3
        x: 360
        y: 35
        width: 118
        height: 36
        color: "#f4f6f5"
        text: week3
        font.bold: true
        font.pointSize: 18
    }
    Label {
        id: week_4
        x: 520
        y: 35
        width: 118
        height: 36
        color: "#f4f6f5"
        text: week4
        font.bold: true
        font.pointSize: 18
    }
    Label {
        id: week_5
        x: 685
        y: 35
        width: 118
        height: 36
        color: "#f4f6f5"
        text: "test"
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
            futureWeather = 0
        }
    }
    function storeWeatherData1(jsonObject) {
        week1 = jsonObject.futureDay[0].week
        weatherstate = jsonObject.futureDay[0].wtNm1
        weatherstate1 = jsonObject.futureDay[1].wtNm1
        weatherstate2 = jsonObject.futureDay[2].wtNm1
        weatherstate3 = jsonObject.futureDay[3].wtNm1
        weatherstate4 = jsonObject.futureDay[4].wtNm2
        week1 = jsonObject.futureDay[0].week
        week2 = jsonObject.futureDay[1].week
        week3 = jsonObject.futureDay[2].week
        week4 = jsonObject.futureDay[3].week
        week5 = jsonObject.futureDay[4].week
    }
    Connections {
        target: weather
        onResponseResult: {
            storeWeatherData1(value)
        }
    }
}
