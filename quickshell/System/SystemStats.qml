pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property int brightness: 0
    property real memUsage: 0
    property int cpuUsage: 0
    property int temperature: 0
    property int battery: 0

    property var lastCpuIdle: 0
    property var lastCpuTotal: 0

    // Screen Brightness Percentage
    Process {
        id: brightnessProc
        command: ["sh", "-c", "brightnessctl info | grep 'Current brightness' | awk '{print $4}'"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                root.brightness = parseInt(data.slice(1, -2)) || 0
            }
        }
        Component.onCompleted: running = true
    }

    // CPU Usage
    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (lastCpuTotal > 0) {
                    cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
                }
                lastCpuTotal = total
                lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    // Memory Usage
    Process {
        id: memProc
        command: ["sh", "-c", "free -b | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var used = parseInt(parts[2]) || 0
                root.memUsage = used / 1.074e+9
            }
        }
        Component.onCompleted: running = true
    }

    // Temperature
    Process {
        id: tempProc
        command: ["sh", "-c", "cat /sys/class/thermal/thermal_zone10/temp"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                root.temperature = parseInt(text.trim()) / 1000 || "N/A"
            }
        }
    }

    // Battery
    Process {
        id: batteryProc
        command: ["sh", "-c", "cat /sys/class/power_supply/*/capacity"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                root.battery = parseInt(text.trim()) || 0
            }
        }
    }

    // Update your timer to run both processes
    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            brightnessProc.running = true
            cpuProc.running = true
            memProc.running = true
            tempProc.running = true
            batteryProc.running = true
        }
    }
}