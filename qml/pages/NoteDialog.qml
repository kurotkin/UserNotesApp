import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property var noteText
    property var noteDateTime

    Column {
        width: parent.width
        DialogHeader {
            acceptText: "Сохранить"
            cancelText: "Отменить"
        }

        TextArea {
            id: noteArea
            placeholderText: "Заметка"
            label: "Заметка"
        }

        TextArea {
            id: noteDate
            placeholderText: "Дата и время"
            label: "Дата и время"
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
