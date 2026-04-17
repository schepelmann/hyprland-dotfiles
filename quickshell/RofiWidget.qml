import QtQuick
import Quickshell.Wayland

import "Themes" as Themes

Item {
    implicitWidth: textItem.implicitWidth
    implicitHeight: textItem.implicitHeight
    anchors.margins: 8

    Text {
        id: textItem
        text:  " 󰣇 "
        color: Themes.Catppuccin.blue
        font { pixelSize: 18; bold: true }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: Wayland.showRofi()
        }
    }
}