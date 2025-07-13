import QtQuick 2.15
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3
import org.kde.plasma.plasmoid 2.0
import org.kde.kirigami 2.20 as Kirigami

Applet {
    id: root
    width: 300
    height: 400

    compactRepresentation: PlasmaCore.IconItem {
        width: Kirigami.Units.iconSizes.medium
        height: Kirigami.Units.iconSizes.medium
        source: "chat"
    }

    fullRepresentation: PlasmaComponents3.Page {
        ColumnLayout {
            anchors.fill: parent
            spacing: Kirigami.Units.smallSpacing

            PlasmaComponents3.Label {
                text: "ChatGPT"
                Layout.alignment: Qt.AlignHCenter
            }

            PlasmaComponents3.TextField {
                id: input
                placeholderText: "Ask something..."
                Layout.fillWidth: true
            }

            PlasmaComponents3.Button {
                text: "Send"
                onClicked: console.log("You asked: " + input.text)
            }
        }
    }
}
