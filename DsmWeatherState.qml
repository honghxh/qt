import QtQuick 2.0
import QtQml.StateMachine 1.0 as DSM

Item {
    DSM.StateMachine {
        initialState: weather_main_show
        running: true

        DSM.State {
            id: weather_main_show
        }
    }
}
