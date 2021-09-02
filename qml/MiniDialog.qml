import QtQuick 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.2

ApplicationWindow{
    id:root
    width: 700
    height: 200
    flags: Qt.FramelessWindowHint
    color: Qt.rgba(0,0,0,0)

    property alias musicStart: musicStart
    property alias musicPause:musicPause
    property alias miniText: miniText

    MouseArea{
        anchors.fill: parent
        property point clickPos: "0,0"
        onPressed: {
            clickPos = Qt.point(mouse.x, mouse.y)
        }
        onPositionChanged: {
            var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
            root.x = root.x+delta.x
            root.y = root.y+delta.y
        }
    }

    HoverHandler{
        onHoveredChanged: {
            if(hovered){
                toolRec.opacity =1
                toolRec.visible=true
                root.color = Qt.rgba(0.5,0.5,0.5,0)
            }
            if(!hovered){
                toolRec.opacity =0
                root.color = Qt.rgba(0,0,0,0)
                toolRec.visible=false
            }
        }
    }
    ColumnLayout{
        anchors.fill: parent
        RowLayout {
            id: toolRec
            height: 30
            visible: false
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            ToolButton {
                id:musicPrevious
                icon.name: "media-skip-backward"
                onClicked: {
                    actions.previousAction.triggered()
                }
            }
            ToolButton{
                id:musicStart
                icon.name:"media-playback-start"
                visible: true
                onClicked: {
                    actions.playAction.triggered()
                }
            }
            ToolButton{
                id:musicPause
                visible: false
                icon.name: "media-playback-pause"
                onClicked: {
                    actions.pauseAction.triggered()
                }
            }

            ToolButton {
                id:musicNext
                icon.name: "media-skip-forward"
                onClicked: {
                    actions.nextAction.triggered()
                }
            }
            ToolButton {
                id:musicFastfowardfivescd
                icon.name: "media-seek-backward"
                onClicked: {
                    actions.backfiveScdAction.triggered()
                }
            }
            ToolButton {
                id:musicBackfivescd
                icon.name: "media-seek-forward"
                onClicked: {
                    actions.fastforwardfiveScdAction.triggered()
                }
            }
            ToolButton {
                icon.name: "window-close"
                onClicked: {
                    close()
                    content.musicPlayer.wordBackground.color = "#E0F2F7"
                    content.musicPlayer.wordFlag=false
                }
            }
        }
        Text {
            id: miniText
            Layout.fillHeight: true
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            opacity: 1
            color: "red"
            font.pixelSize:30
            text: " "
            MouseArea{
                anchors.fill: parent
                property point clickPos: "0,0"
                onPressed: {
                    clickPos = Qt.point(mouse.x, mouse.y)
                }
                onPositionChanged: {
                    var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
                    root.x = root.x+delta.x
                    root.y = root.y+delta.y
                }
            }
        }
    }
}
