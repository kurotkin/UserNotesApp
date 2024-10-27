import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    Dao{id: dao}

    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            objectName: "pageHeader"
            title: qsTr("Notes")
        }
        model: ListModel { id: noteModel }
        delegate: ListItem {
            contentHeight: Theme.itemSizeExtraLarge
            Column{
                anchors.right: parent.right
                IconButton {
                    icon.source: "image://theme/icon-m-edit?" + (pressed ? Theme.highlightColor: Theme.primaryColor)
                    onClicked: {
                        var dialog = pageStack.push("NoteDialog.qml", {"noteDateTime": date, "noteText": name});
                        dialog.accepted.connect(function() {
                            dao.updateNote(id, dialog.noteDateTime, dialog.noteText)
                            selectBooks();
                        });
                    }
                }
                IconButton {
                    icon.source: "image://theme/icon-m-cancel?" + (pressed ? Theme.highlightColor: Theme.primaryColor)
                    onClicked: {
                        dao.deleteNote(id);
                        selectBooks();
                    }
                }
            }
            Column{
                anchors {
                    left: parent.left
                    leftMargin: Theme.horizontalPageMargin
                    right: parent.right
                    rightMargin: Theme.horizontalPageMargin
                }
                Label {
                    text: qsTr("Created") + create_date
                    font.pixelSize: Theme.fontSizeExtraSmall
                }
                Label {
                    text: date
                }
                Label {
                    text: name
                }
            }
        }
        PullDownMenu {
            MenuItem {
                text: qsTr("Add note")
                onClicked: {
                    var dialog = pageStack.push("NoteDialog.qml");
                    dialog.accepted.connect(function() {
                        dao.insertNote(Qt.formatDateTime(new Date(), "hh:mm dd.MM.yyyy"), dialog.noteDateTime, dialog.noteText);
                        selectBooks();
                    });
                }
            }
        }
    }

    function selectBooks() {
        noteModel.clear();
        dao.selectNote(function (notes) {
            for (var i = 0; i < notes.length; i++) {
                var note = notes.item(i);
                noteModel.append({
                   id: note.id,
                   create_date: note.create_date,
                   date: note.date,
                   name: note.name
               });
             }
        });
    }

    Component.onCompleted: {
        selectBooks();
    }
}
