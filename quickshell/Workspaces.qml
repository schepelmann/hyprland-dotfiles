import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

import "Themes"

RowLayout {
    spacing: 8

    property var numbers: [
        "일", "이", "삼", "사", "오", "육", "칠", "팔", "구", "십"
    ]

    Repeater {
        model: 10

        Text {
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === index + 1
            text: numbers[index]
            color: isActive ? Catppuccin.red : (ws ? Catppuccin.yellow : Catppuccin.surface2)
            font { pixelSize: 14; bold: true }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
            }
        }
    }
}