import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
Popup {
    id: editImageURLPopup
    property var actor: null

    height: window.height * 0.4
    width: window.width * 0.4

    x: parent.width/2 - width/2
    y: parent.height/2 - height/2

    dim: true
    modal: true

    Text{
        color: "white"
        text: qsTr("Change URL")
        font.pixelSize: 22
        width: parent.width
    }

    TextField{
        id: urlTextfield
        width: parent.width
        placeholderText: qsTr("Type in your URL here")
        anchors.centerIn: parent
        validator: RegExpValidator { regExp: /(www|http:|https:)+[^\s]+[\w]/ }
        selectByMouse: true
        onAccepted: confirmURL()
        Material.accent: acceptableInput ? Material.Green : Material.Red
    }
    Text{
        font.pixelSize: 10
        color: Material.color(Material.Red)
        anchors.right: urlTextfield.right
        anchors.top: urlTextfield.bottom
        text: qsTr("Input not valid")
        visible: !urlTextfield.acceptableInput && urlTextfield.text != ""
    }

    Button{
        anchors.bottom: parent.bottom
        width: parent.width
        height: urlTextfield.height
        text: qsTr("Confirm")
        enabled: urlTextfield.acceptableInput
        onClicked: confirmURL();
    }

    function confirmURL(){
        if(!urlTextfield.acceptableInput)
            return;
        //Setting new url
        editImageURLPopup.actor.imageURL = urlTextfield.text;

        close();
    }
}
