//code from https://github.com/fecub/HelloQtLocalStorage
.import QtQuick.LocalStorage 2.0 as Storage

function getDatabase()
{
     return Storage.LocalStorage.openDatabaseSync("plarm", "0.1", "plarm database is localdatabse to save application data, later can fetch/send these data into API for backup/sync with other devices", 100);
}
