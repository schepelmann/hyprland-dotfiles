import QtQuick
import QtQuick.Layouts
import Quickshell

import "Clock"
import "System"
import "Themes"


Scope {

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 38

      color: "transparent"

      RowLayout {
        spacing: 8
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.fill: parent

        anchors.topMargin: 5

        Rectangle {
          Layout.alignment: Qt.AlignLeft
          height: parent.height
          width: 270
          radius: 30
          color: Catppuccin.base

          RowLayout {
            anchors.centerIn: parent
            spacing: 10

            RofiWidget {}
            Workspaces {}
          }
        }

        Rectangle {
          anchors.centerIn: parent
          height: parent.height
          width: 250
          radius: 30
          color: Catppuccin.base

          ClockWidget {
            anchors.centerIn: parent
          }
        }

        Rectangle {
          Layout.alignment: Qt.AlignRight
          height: parent.height
          width: 615
          radius: 30
          color: Catppuccin.base

          RowLayout {
            spacing: 10
            anchors.centerIn: parent

            SystemStatsWidget {}
            SystemTrayWidget {}
            PowerButtonWidget {}
          }
        }
      }
    }
  }
}