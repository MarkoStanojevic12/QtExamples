import QtQuick 2.15
import QtQuick.Controls 2.5
Item {
    objectName: "listExample"

    SingleInstanceExample{
        id: singleInstance
        anchors.right: parent.right
        anchors.rightMargin: 32
        height: parent.height
        width: parent.width/2
    }

    ListView{
        id: userList
        anchors.left: parent.left
        anchors.leftMargin: 32
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width * 0.4
        height: parent.height * 0.8
        model: ActorManager.actors
        spacing: 2
        clip: true
        delegate: TabButton{
            height: 60
            width: userList.width
            text: userList.model[index].name + " " + userList.model[index].lastName

            onClicked: singleInstance.actor = userList.model[index];
        }
    }
}
