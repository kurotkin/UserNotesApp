import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property var noteText
    property var noteDateTime

    Column {
        width: parent.width
        DialogHeader {
            acceptText: qsTr("Save")
            cancelText: qsTr("Cancel")
        }

        TextArea {
            id: noteArea
            placeholderText: qsTr("Note")
            label: qsTr("Note")
        }

        TextArea {
            id: noteDate
            placeholderText: qsTr("Date and Time")
            label: qsTr("Date and Time")
        }
    }

    onAccepted: {
       noteText = noteArea.text;
       noteDateTime = noteDate.text;
    }

    Component.onCompleted: {
        noteArea.text = noteText;
        noteDate.text = noteDateTime;
    }
}
