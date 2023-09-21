import QtQuick 2.10
import QtQuick.Particles 2.10

Item {
    width: 400
    height: 400
    property int progress: 200 // 进度值，范围为 0-100
    property int progress1: 100 // 进度值，范围为 0-100
    Item {

        width: 300
        height: 300

        Canvas {
            id: canvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()

                // 绘制底部圆环
                //ctx.strokeStyle = "black"
                //ctx.lineWidth = 15
                //左 1.2667 0.7333 右 2.2667 1.7333
                var startAngle = Math.PI * 2.2667
                var endAngle = Math.PI * 1.7333
                var cx = width / 2
                var cy = height / 2
                var radius = height * 0.4
                //ctx.beginPath()
                // ctx.arc(cx, cy, radius, startAngle, endAngle, true)
                // ctx.stroke()

                // 创建渐变对象
                var gradient = ctx.createLinearGradient(0, cy - radius, 0,
                                                        cy + radius)
                gradient.addColorStop(0.1, "darkcyan")
                gradient.addColorStop(1.0, "darkslategray")

                // 绘制进度圆环，应用渐变样式
                ctx.strokeStyle = gradient
                ctx.lineWidth = 10
                var progressAngle = startAngle + (progress1 / 100) * (endAngle - startAngle)
                ctx.beginPath()
                //最后一个变量控制顺时针和逆时针
                ctx.arc(cx, cy, radius, startAngle, progressAngle, true)
                ctx.stroke()
            }
            antialiasing: true
        }
    }
    Item {
        id: circular1
        x: 800
        y: 30
        width: 400
        height: 400

        Image {
            sourceSize.width: 400
            sourceSize.height: 400
            source: "qrc:/image/bgtest.png"
        }
        Canvas {
            id: canvas1
            width: 400
            height: 400
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d")
                ctx.reset()

                // 绘制底部圆环

                //ctx.strokeStyle = "white"
                // ctx.lineWidth = 20
                var startAngle = Math.PI * 2.2333
                var endAngle = Math.PI * 0.7667
                var cx = width / 2
                var cy = height / 2
                var radius = height * 0.43
                //ctx.beginPath()
                //ctx.arc(cx, cy, radius, startAngle, endAngle, true)
                //ctx.stroke()

                // 创建渐变对象
                var gradient = ctx.createLinearGradient(cx - radius, cy,
                                                        cx + radius, cy)
                // 根据主题不同更换不同颜色覆盖将颜色值提取出来写入变量中
                gradient.addColorStop(0, "#1A1A1A")
                // gradient.addColorStop(1.0, "lightseagreen")

                // 绘制进度圆环，应用渐变样式
                ctx.strokeStyle = gradient
                ctx.lineWidth = 26
                var progressAngle = startAngle + (progress / 200) * (endAngle - startAngle)
                ctx.beginPath()
                ctx.arc(cx, cy, radius, startAngle, progressAngle, true)
                ctx.stroke()
            }
            antialiasing: true
        }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            moveAnimation.start()
        }
    }
    Timer {
        id: canvas_timer
        function setTimeout(cb, delayTime) {
            canvas_timer.interval = delayTime
            canvas_timer.repeat = true
            canvas_timer.triggered.connect(cb)
            canvas_timer.start()
        }
    }
    Component.onCompleted: {
        var increment = -5
        canvas_timer.setTimeout(function () {
            progress1 += increment
            progress += increment
            if (progress <= 0) {

                increment = 5 // 切换为递减模式
            } else if (progress >= 200) {
                increment = -5 // 切换为递增模式
            }
            //canvas.requestPaint()
            canvas1.requestPaint()
        }, 10)
    }
}
