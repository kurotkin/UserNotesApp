import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    objectName: "mainPage"
    allowedOrientations: Orientation.All

    SilicaListView {
        anchors.fill: parent
        header: PageHeader {
            objectName: "pageHeader"
            title: qsTr("Заметки")
            extraContent.children: [
                IconButton {
                    objectName: "aboutButton"
                    icon.source: "image://theme/icon-m-about"
                    anchors.verticalCenter: parent.verticalCenter
                    onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                }
            ]
        }
        model: ListModel { id: noteModel }
        delegate: ListItem {
            Column{
                Label {
                    text: "Создан: " + date
                    font.pixelSize: Theme.fontSizeExtraSmall
                }
                Label {
                    text: note
                }
            }
        }
        PullDownMenu {
            MenuItem {
                text: "Добавить заметку"
                onClicked: {
                    var dialog = pageStack.push("NoteDialog.qml")
                    dialog.accepted.connect(function() { noteModel.append(
                        {note: dialog.noteText, date: Qt.formatDateTime(new Date(), "hh:mm dd.MM.yyyy")}
                    )})
                }
            }
        }
    }


}
