pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root
  readonly property string time: {
    Qt.formatDateTime(clock.date, "󰃭 yyyy년 MM월 dd일  󰥔 hh시 mm분")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}