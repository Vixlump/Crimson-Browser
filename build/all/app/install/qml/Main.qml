import QtQuick 2.9

import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import Morph.Web 0.1
import "Components"
import QtWebEngine 1.10
import Ubuntu.Content 1.3

import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Universal 2.1
import Qt.labs.settings 1.0

import Ubuntu.Components 1.3 as Ubuntu


MainView {
    id: mainLayout
    objectName: 'mainView'
    applicationName: 'crimson-browser.lumpology'
    automaticOrientation: true
    Component.onCompleted: theme.name = "Ubuntu.Components.Themes.Ambiance"
    backgroundColor : "transparent"

    width: units.gu(75)
    height: units.gu(65)
    clip: false
    anchorToKeyboard: true

    property list<ContentItem> importItems

    PageStack {
        id: mainPageStack
        anchors.fill: parent
        Component.onCompleted: mainPageStack.push(pageMain)

        Item {
            id: searchIndex
            property var aURL1: "https://duckduckgo.com/?q="

            property var aSearchEngineCurrent: "ttps://duckduckgo.com/?q="
            property var aSearchEngine1: "https://duckduckgo.com/?q="
            property var aSearchEngine2: "https://www.google.com/search?q="
            property var aSearchEngine3: "https://www.bing.com/search?q="
            property var aSearchEngine4: "https://yandex.com/search/?text="
            property var aSearchEngine5: "https://archive.org/search?query="
            property var aSearchEngine6: "https://www.ecosia.org/search?q="
            property var aSearchEngine7: ""
        }

        Page {
            id: pageMain
            anchors.fill: parent

            footer: TabBar {
                id: tabBar
                currentIndex: swipeView.currentIndex

                TabButton {
                    text: "D"
                    onClicked: {
                        searchIndex.aSearchEngineCurrent = searchIndex.aSearchEngine1
                    }
                }
                TabButton {
                    text: "G"
                    onClicked: {
                        searchIndex.aSearchEngineCurrent = searchIndex.aSearchEngine2
                    }
                }
                TabButton {
                    text: "B"
                    onClicked: {
                        searchIndex.aSearchEngineCurrent = searchIndex.aSearchEngine3
                    }
                }
                TabButton {
                    text: "Y"
                    onClicked: {
                        searchIndex.aSearchEngineCurrent = searchIndex.aSearchEngine4
                    }
                }
                TabButton {
                    text: "A"
                    onClicked: {
                        searchIndex.aSearchEngineCurrent = searchIndex.aSearchEngine5
                    }
                }
                TabButton {
                    text: "E"
                    onClicked: {
                        searchIndex.aSearchEngineCurrent = searchIndex.aSearchEngine6
                    }
                }
                TabButton {
                    text: "Δ"
                    onClicked: {
                        searchIndex.aSearchEngineCurrent = searchIndex.aSearchEngine7
                    }
                }
            }

            WebEngineView {
                id: webview
                anchors.fill: parent
                zoomFactor: units.gu(1) / 8.4
                settings.pluginsEnabled: true
                settings.fullScreenSupportEnabled: true
                settings.dnsPrefetchEnabled: true
                settings.showScrollBars: false
                url: "https://duckduckgo.com/?q="

                profile: WebEngineProfile {
                    id: webContext
                    httpUserAgent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36"
                    storageName: "Storage"
                    persistentStoragePath: "/home/phablet/.cache/crimson-browser.lumpology/QtWebEngine"
                }

                onFileDialogRequested: function(request) {
                    request.accepted = true;
                    var importPage = mainPageStack.push(Qt.resolvedUrl("ImportPage.qml"), {"contentType": ContentType.All, "handler": ContentHandler.Source})
                    importPage.imported.connect(function(fileUrl) {
                        console.log(String(fileUrl).replace("file://", ""));
                        request.dialogAccept(String(fileUrl).replace("file://", ""));
                        mainPageStack.push(pageMain)
                    })
                }

                onNewViewRequested: {
                    request.action = WebEngineNavigationRequest.IgnoreRequest
                    if(request.userInitiated) {
                        Qt.openUrlExternally(request.requestedUrl)
                    }
                }

                onFeaturePermissionRequested: function(url, feature) {
                    print(url, feature)

                    grantFeaturePermission(url, feature, true)
                    //grantFeaturePermission(url, WebEngineView.MediaAudioVideoCapture, true)
                }
            }

            Row {
                spacing: 40
                width: parent.width
                opacity: 0.75
                Button {
                    text: "X"
                    enabled: true
                    onClicked: {
                        fieldsearchbox.text = ""
                    }
                }
                TextField {
                    id: fieldsearchbox
                    placeholderText: "Search"
                }

                Button {
                    text: "->"
                    enabled: true
                    onClicked: {
                        webview.url = searchIndex.aSearchEngineCurrent + fieldsearchbox.text
                    }
                }
                Button {
                    text: "H"
                    enabled: true
                    onClicked: {
                        webview.url = searchIndex.aSearchEngineCurrent
                    }
                }
            }
        }
    }

    QtObject {
        id: internal
        property bool showMenu: true

        function toggleMenu() {
            webview.runJavaScript(`document.querySelectorAll(".sidebar-1tnWFu, .guilds-2JjMmN, .membersWrap-3NUR2t, .sidebarRegion-1VBisG").forEach(function(x) {
		if (x.style.display === "none") {
			x.style.display = "flex";
		} else {
			x.style.display = "none";
		} })`)
            showMenu = !showMenu
        }
    }
}
