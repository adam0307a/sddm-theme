//
// This file is part of SDDM Sugar Candy.
// A theme for the Simple Display Desktop Manager.
//
// Copyright (C) 2018–2020 Marian Arlt
//
// SDDM Sugar Candy is free software: you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by the
// Free Software Foundation, either version 3 of the License, or any later version.
//
// You are required to preserve this and any additional legal notices, either
// contained in this file or in other files that you received along with
// SDDM Sugar Candy that refer to the author(s) in accordance with
// sections §4, §5 and specifically §7b of the GNU General Public License.
//
// SDDM Sugar Candy is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with SDDM Sugar Candy. If not, see <https://www.gnu.org/licenses/>
//

import QtQuick 2.11
import QtQuick.Layouts 1.11
import SddmComponents 2.0 as SDDM

ColumnLayout {
    id: formContainer
    SDDM.TextConstants { id: textConstants }

    property int p: config.ScreenPadding
    property string a: config.FormPosition
    property alias systemButtonVisibility: systemButtons.visible
    property alias clockVisibility: clock.visible
    property bool virtualKeyboardActive
    
    spacing: root.font.pointSize * 0.8

    Item {
        Layout.fillHeight: true
        Layout.preferredHeight: 30
    }

    Clock {
        id: clock
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredWidth: parent.width * 0.9
        Layout.leftMargin: p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
        Layout.topMargin: 0
    }

    Input {
        id: input
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredHeight: root.height / 7
        Layout.leftMargin: p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
        Layout.topMargin: virtualKeyboardActive ? -height * 1.5 : 30
        sessionIndex: sessionSelect.selectedSession
    }

    SessionButton {
        id: sessionSelect
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredWidth: parent.width * 0.85
        Layout.preferredHeight: root.font.pointSize * 2.5
        Layout.leftMargin: p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
        Layout.topMargin: 5
        textConstantSession: textConstants.session
        loginButtonWidth: parent.width * 0.85
    }
    
    Item {
        Layout.fillHeight: true
        Layout.minimumHeight: 20
    }

    SystemButtons {
        id: systemButtons
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredHeight: root.font.pointSize * 3.5
        Layout.maximumHeight: root.font.pointSize * 3.5
        Layout.leftMargin: p != "0" ? a == "left" ? -p : a == "right" ? p : 0 : 0
        Layout.bottomMargin: 20
        exposedSession: sessionSelect.exposeSession
    }
    
    Item {
        Layout.fillHeight: true
        Layout.preferredHeight: 20
    }

}
