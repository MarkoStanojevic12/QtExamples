import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5

Window {
    id: window
    width: 1000
    height: 640
    visible: true
    title: qsTr("QProperty Examples")

    Rectangle{
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Horizontal
            stops:[
                GradientStop { position: 0.0; color: "#000000" },
                GradientStop { position: 1.0; color: "#323232" }
            ]
        }
        StackView{
            id: stackView
            anchors.fill: parent
            initialItem: singleInstanceExample
        }

        Component{
            id: singleInstanceExample;
            SingleInstanceExample{}
        }
        Component{
            id: listExample;
            ListExample{ }
        }

        Button{
            anchors.right: parent.right; anchors.rightMargin: 32
            anchors.bottom: parent.bottom; anchors.bottomMargin: 32
            height: 50
            width: 200
            text: stackView.currentItem.objectName == "singleInstanceExample" ? qsTr("Forward") : qsTr("Back")
            onClicked: stackView.currentItem.objectName == "singleInstanceExample" ? stackView.push(listExample) : stackView.pop();
        }
    }
}
