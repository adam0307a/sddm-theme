//
// Modern Welcome Text Component
// Glassmorphic SDDM Theme
//

import QtQuick 2.11
import QtQuick.Controls 2.4

Column {
    id: welcomeContainer
    spacing: 12
    width: parent.width
    
    Label {
        id: welcomeText
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Welcome Back!"
        font.pointSize: root.font.pointSize * 2.5
        font.weight: Font.ExtraLight
        color: root.palette.text
        renderType: Text.QtRendering
        opacity: 0
        
        Component.onCompleted: {
            fadeInAnimation.start()
        }
        
        NumberAnimation {
            id: fadeInAnimation
            target: welcomeText
            property: "opacity"
            from: 0
            to: 1
            duration: 800
            easing.type: Easing.OutCubic
        }
    }
    
    Rectangle {
        id: separator
        anchors.horizontalCenter: parent.horizontalCenter
        width: 60
        height: 3
        radius: 2
        color: root.palette.highlight
        opacity: 0.6
        
        SequentialAnimation on opacity {
            loops: Animation.Infinite
            NumberAnimation { to: 1; duration: 1500; easing.type: Easing.InOutQuad }
            NumberAnimation { to: 0.6; duration: 1500; easing.type: Easing.InOutQuad }
        }
    }
}
