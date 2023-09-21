import QtQuick 2.12
import QtGraphicalEffects 1.0

Item {
    id: driveMode
    width: 88
    height: 46
    property int currentDriveMode: 0

    Item {
        id: driveModeItem
        height: 20
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        clip: true
        layer.enabled: true
        layer.effect: OpacityMask {
            id: opacityMask
            invert: true
            maskSource: mask
        }
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        Text {
            id: driveModeName
            x: 0
            y: 0

            width: 65
            height: 44
            //color: Themes.labelColor
            font.pixelSize: 18
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
            wrapMode: Text.Wrap
            font.weight: Font.Medium

            //font.family: Constants.font.family
            text: "SPORT CITY ECO"
        }
        Rectangle {
            id: mask
            y: 0

            height: 15
            visible: false
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ffffff"
                }

                GradientStop {
                    position: 0.8995
                    color: "#00ffffff"
                }

                GradientStop {
                    position: 0.10021
                    color: "#00ffffff"
                }

                GradientStop {
                    position: 1
                    color: "#ffffff"
                }
            }
            clip: true
        }
    }
    //当数值变化时将其状态改变并改变组件的属性值,但是加上transitions,不是生硬的直接将值对应的画面展现出来,通过transitions达到动画效果
    states: [
        State {
            name: "sportMode"
            when: driveMode.currentDriveMode === 0
        },
        State {
            name: "cityMode"
            when: driveMode.currentDriveMode === 1

            PropertyChanges {
                target: driveModeName
                x: 0
                y: -19
            }
        },
        State {
            name: "ecoMode"
            when: driveMode.currentDriveMode === 2

            PropertyChanges {
                target: driveModeName
                x: 0
                y: -40
            }
        }
    ]
    transitions: [
        Transition {
            id: transition
            ParallelAnimation {
                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: driveModeName
                        property: "x"
                        duration: 300
                    }
                }

                SequentialAnimation {
                    PauseAnimation {
                        duration: 50
                    }

                    PropertyAnimation {
                        target: driveModeName
                        property: "y"
                        duration: 300
                    }
                }
            }
            to: "*"
            from: "*"
        }
    ]
    MouseArea {
        anchors.fill: parent
        onClicked: {
            currentDriveMode = (currentDriveMode + 1) % 3
        }
    }
}
