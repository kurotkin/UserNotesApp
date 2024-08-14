TARGET = com.kurotkin.UserNotesApp

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    qml/pages/NoteDialog.qml \
    rpm/com.kurotkin.UserNotesApp.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/com.kurotkin.UserNotesApp.ts \
    translations/com.kurotkin.UserNotesApp-ru.ts \
