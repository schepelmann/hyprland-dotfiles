import QtQuick
import Quickshell
import Quickshell.Io

import "../Themes" as Themes

Item {
    height: 24
    width: textItem.width + 18

    property int battery: SystemStats.battery

    property string batteryIcon: {
        if (battery > 80) return "󰁹"
        if (battery > 60) return "󰂀"
        if (battery > 40) return "󰁾"
        if (battery > 20) return "󰁻"
        return "󰂎"
    }

    Text {
        id: textItem
        anchors.centerIn: parent
        
        text: batteryIcon + " " + battery + "% "
        color: Themes.Catppuccin.yellow
        font.pixelSize: 14
    }
}