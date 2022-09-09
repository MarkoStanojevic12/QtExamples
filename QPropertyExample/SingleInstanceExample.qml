import QtQuick 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.15
Item {
    id: actorDetails
    objectName: "singleInstanceExample"

    property var actor: ActorManager.singleInstanceActor
    readonly property string name: actor.name
    readonly property string lastName: actor.lastName
    readonly property string bestMovie: actor.bestMovie
    readonly property int rating: actor.rating
    readonly property string imageURL: actor.imageURL

    EditImageURLPopup{ id: editImageURLPopup; actor: actorDetails.actor; }
    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 32

        Rectangle{
            id: frame
            Layout.topMargin: 68
            Layout.preferredWidth: 300
            Layout.preferredHeight: 260
            border.width: 3
            border.color: "white"
            color: "transparent"
            Layout.alignment: Qt.AlignHCenter
            radius: 10

            BusyIndicator {
                running: profileImage.state != Image.Ready && profileImage.source != ""
                anchors.centerIn: parent
                height: parent.height * 0.3
            }

            Text{
                anchors.centerIn: profileImage
                width: profileImage.width
                horizontalAlignment: Qt.AlignHCenter
                text: qsTr("No Image Found")
                visible: profileImage.source == ""
                color: "white"
                font.pixelSize: 22
            }

            Image{
                id: profileImage
                fillMode: Image.PreserveAspectCrop
                anchors.fill: parent
                asynchronous: true
                source: actorDetails.imageURL
                layer.enabled: true
                layer.effect: OpacityMask {
                    maskSource: Item {
                        width: profileImage.width
                        height: profileImage.height
                        Rectangle {
                            anchors.centerIn: parent
                            width:  profileImage.width
                            height:  profileImage.height
                            radius: frame.radius
                            color: "black"
                        }
                    }
                }
            }
            TabButton{
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.margins: 16
                icon.height: 30
                icon.width: 30
                icon.source: "edit.svg"
                layer {
                    enabled: true
                    effect: ColorOverlay {
                        cached: true
                        color: "white"
                    }
                }
                onClicked: editImageURLPopup.open();
            }

        }

        RowLayout{
            Layout.topMargin: 8
            Layout.preferredWidth: frame.width
            Layout.alignment: Qt.AlignHCenter
            Item{ Layout.fillWidth: true;}
            Repeater{
                model: actorDetails.rating
                Image{
                    sourceSize.height: 22
                    Layout.alignment: Qt.AlignCenter
                    source: "star.svg"
                    layer {
                        enabled: true
                        effect: ColorOverlay {
                            cached: true
                            color: "yellow"
                        }
                    }
                }
            }
            Item{ Layout.fillWidth: true;}
        }

        Text{
            Layout.alignment: Qt.AlignHCenter
            text: actorDetails.name + " " + actorDetails.lastName
            font.bold: true
            font.pixelSize: 48
            color: "white"
            Layout.topMargin: 32
        }

        Text{
            Layout.alignment: Qt.AlignHCenter
            text: actorDetails.bestMovie
            font.bold: false
            font.pixelSize: 22
            color: "white"
            Layout.topMargin: 12
            opacity: 0.7
        }

        Item{ Layout.fillHeight: true; }
    }
}
