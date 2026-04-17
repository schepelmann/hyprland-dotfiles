import QtQuick
import Quickshell
import Quickshell.Io

import "../Themes" as Themes

Item {
    height: 24
    width: textItem.width + 18

    Text {
        id: textItem
        anchors.centerIn: parent
        text: "󰃠 " + SystemStats.brightness + "%"
        color: Themes.Catppuccin.lavender
        font.pixelSize: 14
    }
}
