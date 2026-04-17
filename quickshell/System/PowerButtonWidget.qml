import QtQuick
import Quickshell
import Quickshell.Widgets

import "../Themes" as Themes

Rectangle {
    height: 24
    width: textItem.width + 18
    radius: 14
    color: Themes.Catppuccin.surface1

    Text {
        id: textItem
        anchors.centerIn: parent
        text: "󰐥"
        color: Themes.Catppuccin.red
        font { pixelSize: 14; bold: true }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached("/home/marcel/.config/rofi/powermenu.sh")
        }

        onEntered: parent.color = Themes.Catppuccin.surface0
    }
}