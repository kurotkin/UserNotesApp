import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property var noteText

    DialogHeader {
        acceptText: "Сохранить"
        cancelText: "Отменить"
    }
    TextArea {
        id: noteArea
        anchors.centerIn: parent
        placeholderText: "Заметка"
        label: "Заметка"
    }
    onAccepted: noteText = noteArea.text
}
