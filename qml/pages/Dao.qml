import QtQuick 2.0
import QtQuick.LocalStorage 2.0

QtObject {
    id: root
    property var db

    function selectNote(callback) {
        db.readTransaction(function (tx) {
            var result = tx.executeSql("SELECT * FROM notes;");
            callback(result.rows);
        });
    }

    function insertNote(create_date, date, name) {
        db.transaction(function (tx) {
            tx.executeSql("INSERT INTO notes (create_date, date, name) VALUES(?, ?, ?);",
                [create_date, date, name]);
        });
    }

    function updateNote(id, date, name) {
        db.transaction(function (tx) {
            tx.executeSql("UPDATE notes SET date = ?, name = ? WHERE id = ?;",[date, name, id]);
        });
    }

    function deleteNote(id) {
        db.transaction(function (tx) {
            tx.executeSql("DELETE FROM notes WHERE id = ?;", [id]);
        });
    }

    Component.onCompleted: {
        db = LocalStorage.openDatabaseSync("usernotes", "1.0");
        db.transaction(function (tx) {
                tx.executeSql("CREATE TABLE IF NOT EXISTS notes (id INTEGER PRIMARY KEY AUTOINCREMENT, create_date TEXT, date TEXT, name TEXT);");
            }
        );
    }
}
