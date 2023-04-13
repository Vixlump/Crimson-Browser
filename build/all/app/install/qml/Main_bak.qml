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
            id:searchIndex
            property var aURL_home: "https://duckduckgo.com"
            property var aURL_pre: "https://duckduckgo.com"
            property var aURL1: "https://duckduckgo.com"
            property var aURL2: "https://duckduckgo.com"
            property var aURL3: "https://duckduckgo.com"
            property var aSearch: false
        }

        Page {
            id: pageMain
            anchors.fill: parent

            /*SwipeView {
                id: swipeView
                anchors.fill: parent
                currentIndex: tabBar.currentIndex

                Item {
                    id: tab1

                }
                Item {
                    id: tab2
                }
                Item {
                    id: tab3
                }
                Item {
                    id: tab4
                    Column {
                        spacing: 40
                        width: parent.width
                        Label {
                            width: parent.width
                            wrapMode: Label.Wrap
                            horizontalAlignment: Qt.AlignHCenter
                            text: "\n"
                            + "\n"
                            + "This app is mearly a concept, but it does save some logins on websites. Feel free to give it a try!\n"
                            + "UT is very lacking in the ability to retain login information in a browser, so my intention is to try and change this."
                            + "If you sign into a website, the login should be preserved when the app is closed and or device rebooted."
                        }
                    }
                }
            }*/
                
            footer: TabBar {
                id: tabBar
                currentIndex: swipeView.currentIndex

                TabButton {
                    text: "α"
                }
                TabButton {
                    text: "β"
                }
                TabButton {
                    text: "δ"
                }
                /*TabButton {
                    text: "ε"
                }
                TabButton {
                    text: "ζ"
                }
                TabButton {
                    text: "η"
                }*/
                TabButton {
                    text: "Δ_θ"
                }
            }
                        WebEngineView {
                            id: webview
                            anchors { fill: parent }
                            //focus: true
                            zoomFactor: units.gu(1) / 8.4
                            settings.pluginsEnabled: true
                            settings.fullScreenSupportEnabled: true
                            settings.dnsPrefetchEnabled: true
                            settings.showScrollBars: false
                            url: "https://duckduckgo.com/"

                            profile:  WebEngineProfile {
                                id: webContext
                                httpUserAgent: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36"
                                storageName: "Storage"
                                persistentStoragePath: "/home/phablet/.cache/crimson-browser.lumpology/QtWebEngine"
                            }

                            onFileDialogRequested: function(request) {
                                request.accepted = true;
                                var importPage = mainPageStack.push(Qt.resolvedUrl("ImportPage.qml"),{"contentType": ContentType.All, "handler": ContentHandler.Source})
                                importPage.imported.connect(function(fileUrl) {
                                    console.log(String(fileUrl).replace("file://", ""));
                                    request.dialogAccept(String(fileUrl).replace("file://", ""));
                                    mainPageStack.push(pageMain)
                                })
                            }
                            onNewViewRequested: {
                                request.action = WebEngineNavigationRequest.IgnoreRequest
                                if(request.userInitiated) {
                                    Qt.openUrlExternally(request. requestedUrl)
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
                //color: Theme.name == "Ubuntu.Components.Themes.SuruDark" ? "orange" : "red"
                opacity: 0.75
                TextField {
                    id: fieldsearchbox
                    placeholderText: "Δ_Search (not working)"
                    //anchors.horizontalCenter: parent.horizontalCenter
                }
                Button {
                    text: "Search"
                    enabled: true
                    onClicked: {
                        webview.url = "https://duckduckgo.com/?q=" + fieldsearchbox
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
