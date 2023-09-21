import QtQuick 2.12

Item {

    Rectangle {
        x: 8
        y: 73
        height: 34
        width: 432 * (progress / 120)
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "transparent"
            }
            GradientStop {
                position: 0.4
                color: "skyblue"
            }
            GradientStop {
                position: 0.6
                color: "#47c0ec"
            }
            GradientStop {
                position: 1
                color: "#47c0ec"
            }
            orientation: Gradient.Horizontal
        }
    }
}
