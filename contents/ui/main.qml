import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtWebEngine
import org.kde.plasma.core 2.0
import org.kde.plasma.plasmoid 2.0

PlasmoidItem {
    id: root

    width: 600
    height: 800

    ColumnLayout {
        anchors.fill: parent

        WebEngineView {
            id: gptWebView

            Layout.fillWidth: true
            Layout.fillHeight: true
            url: "https://chatgpt.com"
            focus: true
            // onConsoleMessage: {
            //     if (!message.includes("[Statsig]") && !message.includes("failed to fetch"))
            //         console.log("WebEngine:", message);

            // }

            profile: WebEngineProfile {
                id: gptProfile

                offTheRecord: false
                storageName: "chatgpt"
                persistentCookiesPolicy: WebEngineProfile.ForcePersistentCookies
                downloadPath: StandardPaths.writableLocation(StandardPaths.DownloadLocation)
                onDownloadRequested: function(download) {
                    download.downloadDirectory = StandardPaths.writableLocation(StandardPaths.DownloadLocation);
                    download.accept();
                    download.finished.connect(function() {
                        console.log("Download finished:", download.downloadDirectory + "/" + download.downloadFileName);
                    });
                }
            }

        }

    }

}
