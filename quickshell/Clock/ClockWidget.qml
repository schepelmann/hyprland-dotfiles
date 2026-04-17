import QtQuick
import "../Themes" as Themes

Text {
    text: Time.time
    color: Themes.Catppuccin.text
    font { pixelSize: 14; bold: true }
}