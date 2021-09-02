import QtQuick 2.12
import QtQuick.Controls 2.5
Item {
    property alias newAction: newA
    property alias openAction: openLyric
    property alias saveAction: save
    property alias closeAction: close
    property alias exitAction: exit
    property alias copyAction: copy
    property alias pasteAction: paste
    property alias cutAction: cut
    property alias undoAction: undo
    property alias redoAction: redo
    property alias addTagAction: addTag
    property alias deleteHeaderLabelAction:deleteHeaderLabel
    property alias deleteAllLabelAction:deleteAllLabel
    property alias testAction: test

    Action{
       id:newA
       text: qsTr("新建")
       shortcut: StandardKey.New
       icon.name: "document-new"
    }


    Action{
        id:openLyric
        text: qsTr("打开文件")
        shortcut: StandardKey.Open
        icon.name:"document-open"
    }
    Action{
        id:save
        text: qsTr("保存")
        shortcut: StandardKey.Save
        icon.name: "document-save"
    }
    Action{
        id:close
        text: qsTr("关闭")
       shortcut: StandardKey.Close
       icon.name: "document-close"
       enabled: textArea.text.length === 0 ? false : true
    }
    Action{
        id:exit
        text: qsTr("退出")
        shortcut: StandardKey.Quit
        icon.name:"application-exit"
    }
    Action{
        id:copy
        text: qsTr("复制")
        shortcut: StandardKey.Copy
        icon.name: "edit-copy"
    }
    Action{
        id:paste
        text: qsTr("粘贴")
        shortcut: StandardKey.Paste
        icon.name: "edit-paste"
    }
    Action{
        id:cut
        text: qsTr("剪切")
        shortcut: StandardKey.Cut
        icon.name: "edit-cut"
    }
    Action{
        id:undo
        text:qsTr("撤销")
        shortcut: StandardKey.Undo
        icon.name: "edit-undo"
    }

    Action{
        id:redo
        text:qsTr("重做")
        shortcut: StandardKey.Redo
        icon.name: "edit-redo"
    }


    Action{
        id:addTag
        text: qsTr("加入标签[00:00.00]")
        icon.source: "../resource/image/add.png"
    }
    Action{
        id:deleteHeaderLabel
        text: qsTr("删除行内首标签")
        icon.source: "../resource/image/delete.png"
    }
    Action{
        id:deleteAllLabel
        text: qsTr("删除行内所有标签")
    }
    Action{
        id:test
        text: qsTr("测试")
        icon.source: "../resource/image/test.png"
        enabled: content.musicPlayer.pause.visible & textArea.length!==0
    }
}
