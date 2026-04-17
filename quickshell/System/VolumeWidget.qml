import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Pipewire

import "../Themes" as Themes

Item {
    height: 24
    width: volContent.width + 18

    PwObjectTracker {
        id: tracker
        objects: [Pipewire.defaultAudioSink]
    }

    property string volumeIcon: {
        const sink = Pipewire.defaultAudioSink;
        if (!sink || !sink.audio || sink.audio.muted || sink.audio.volume <= 0) return "󰖁";
        if (sink.audio.volume < 0.33) return "󰕿";
        if (sink.audio.volume < 0.66) return "󰖀";
        return "󰕾";
    }

    Row {
        id: volContent
        anchors.centerIn: parent

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: {
                const sink = Pipewire.defaultAudioSink;
                if (!sink || !sink.audio || sink.audio.muted || sink.audio.volume <= 0) return "󰖁";
                if (sink.audio.volume < 0.33) return "󰕿";
                if (sink.audio.volume < 0.66) return "󰖀";
                return "󰕾";
            }
            color: Themes.Catppuccin.blue
            font.pixelSize: 14
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            text: {
                const sink = Pipewire.defaultAudioSink;
                if (!sink || !sink.audio) return "–";
                if (sink.audio.muted) return "Mute";
                return Math.round(sink.audio.volume * 100) + "%";
            }
            color: Themes.Catppuccin.blue
            font.pixelSize: 14
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton
        onClicked: {
            // const sink = Pipewire.defaultAudioSink;
            // if (sink && sink.audio) sink.audio.muted = !sink.audio.muted;
            Quickshell.execDetached("pavucontrol")
        }
        onWheel: (wheel) => {
            const sink = Pipewire.defaultAudioSink;
            if (!sink || !sink.audio) return;
            const delta = wheel.angleDelta.y > 0 ? 0.01 : -0.01;
            sink.audio.volume = Math.max(0, Math.min(1.5, sink.audio.volume + delta));
        }
    }
}