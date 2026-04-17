import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

import "../Themes" as Themes

Rectangle {
    height: 24
    width: 420
    radius: 14
    color: Themes.Catppuccin.surface1

    RowLayout {
        anchors.centerIn: parent
        spacing: 4
        BrightnessWidget {
          anchors.left: parent
        }

        VolumeWidget {
          anchors.left: parent
        }

        CPUWidget {
          anchors.left: parent
        }

        MemoryWidget {
          anchors.left: parent
        }

        TempWidget {
          anchors.left: parent
        }

        BatteryWidget {
          anchors.left: parent
        }
    }
}