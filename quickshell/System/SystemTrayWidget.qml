import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import "../Themes" as Themes

Rectangle {
    implicitHeight: 24
    implicitWidth: trayIcons.implicitWidth + 18
    radius: 12
    color: Themes.Catppuccin.surface1

    RowLayout {
        id: trayIcons
        anchors.centerIn: parent
        spacing: 5

        Repeater {
            model: SystemTray.items

            MouseArea {
                id: trayDelegate
                required property SystemTrayItem modelData

                Accessible.role: Accessible.Button
                Accessible.name: modelData.tooltipTitle || modelData.title || "System tray item"

                Component.onCompleted: {
                    console.log("Item Icon:", trayDelegate.modelData.icon)
                }

                Layout.preferredWidth: 24
                Layout.preferredHeight: 24

                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                onClicked: (mouse) => {
                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate()
                    } else if (mouse.button === Qt.RightButton) {
                        modelData.display(
                            trayDelegate.QsWindow.window,
                            mapToGlobal(mouse.x, mouse.y).x,
                            mapToGlobal(mouse.x, mouse.y).y
                        )
                    } else if (mouse.button === Qt.MiddleButton) {
                        modelData.secondaryActivate()
                    }
                }

                IconImage {
                    anchors.centerIn: parent
                    source: trayDelegate.modelData.icon
                    implicitSize: 22
                }
            }
        }
    }
}