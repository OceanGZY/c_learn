import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import MarkDownCore 1.0
import QtWebEngine 1.9
import QtWebChannel 1.0

import "../3rdparty/showdown.js" as ShowDown


Item {
    id: _edit
    visible: true
    property bool isShowPreviw: true
    width: parent.width
    height: parent.height
    signal inputMd(string text)

    MarkDownCore {
        id : _mdcore
        onHasMarkdownIn: console.log(_mdcore.mdRes)

    }

    WebChannel {
        id: _textEditWebChannel
        registeredObjects: [_textIn]
    }

    Column {
        id : _editView
        width: parent.width
        height: parent.height
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.leftMargin: 0


        Rectangle {
            id: _editTools
            width: parent.width
            height: 28
            color: "#ededed"
            Row{
                id: _editToolBar
                spacing: 2
                anchors.verticalCenter: parent.verticalCenter


                Button{
                    id: _bold
                    text: "粗体"
                }

                Button{
                    id: _italitic
                    text: "斜体"
                }

                Button{
                    id: _leftAlign
                    text: "左对齐"
                }

                Button{
                    id: _centerAlign
                    text: "中对齐"
                }

                Button{
                    id: _rightAlign
                    text: "右对齐"
                }
            }
        }

        Rectangle {
            id: _editContainer
            width: parent.width
            height: parent.height - 28
//            color: "red"

            SplitView {
                id: _editItem
                anchors.fill: parent
                orientation: Qt.Horizontal
//                spacing: 2
//                width: parent.width
//                height: parent.height

                Rectangle {
                    id: _editContent
                    implicitWidth: parent.width*0.5
//                    width: parent.width * 0.5
                    height: parent.height
                    clip: true
                    Keys.onUpPressed: _vbar.decrease()
                    Keys.onDownPressed: _vbar.increase()

                    TextEdit {
                        id: _textIn
                        WebChannel.id: "_textInObj"
                        text: _mdcore.mdRes
                        focus: true
                        x: 8
                        y: -_vbar.position * _textIn.height
                        width: parent.width-8-_vbar.width
                        height:  contentHeight
                        wrapMode: TextEdit.Wrap
                        font.pixelSize: 12
                        selectByKeyboard: true
                        selectByMouse: true
                        cursorPosition: _textIn.text.length
                        onTextChanged: {
                            console.log("_textIn.text:"+_textIn.text)
//                           _textOut.text = Marked.marked.parse(_textIn.text)
//                            var _tmp = ShowDown.markdown2Html(_textIn.text)
//                            _textOut.loadHtml(_tmp,"index.html")
                        }

                        MouseArea {
                            anchors.fill: _textIn
                            hoverEnabled: true
                            propagateComposedEvents: true
                            onWheel:(wheel)=>{
    //                                console.log("w轮子滚动"+wheel.angleDelta.y)
                                if(wheel.angleDelta.y >0){
                                    _vbar.decrease()
    //                                    console.log("y大于0_vbar.height"+_vbar.height)
    //                                    console.log("y大于0 _vbar.width"+_vbar.width)
    //                                    console.log("y大于0 _vbar.size"+_vbar.size)
    //                                    console.log("y大于0 _vbar.position"+_vbar.position)
                                }
                                else if((wheel.angleDelta.y <0)) {
                                    _vbar.increase()
                                }
                            }
                            onClicked:(mouse)=> {
                                _textIn.forceActiveFocus();
                                mouse.accepted = false;
                            }
                            onPressed:(mouse)=> {
                               mouse.accepted = false;
                            }
                            onReleased: (mouse)=>{
                                mouse.accepted = false;
                            }
                            onDoubleClicked:(mouse)=> {
                                mouse.accepted = false;
                            }
                            onPositionChanged: (mouse)=>{
                                mouse.accepted = false;
                            }
                            onPressAndHold:(mouse)=> {
                                mouse.accepted = false;
                            }
                        }

                    }

                    ScrollBar {
                        id: _vbar
                        hoverEnabled: true

                        active: hovered || pressed
                        orientation: Qt.Vertical
                        size: _editContent.height / _textIn.height
                        width:4
                        anchors.top: parent.top
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom

                    }
                }

                Rectangle {
                    id: _previwContent
                    implicitWidth: parent.width * 0.5
                    height: parent.height
//                    color: "#f2eada"
                    clip: true
                    Keys.onUpPressed: _vbar.decrease()
                    Keys.onDownPressed: _vbar.increase()

                    WebEngineView {
                        id: _textOut
                        anchors.fill: parent
                        visible: true
                        url:"qrc:/assets/static/index.html"
                        webChannel: _textEditWebChannel
                    }

//                    TextEdit {
//                        id: _textOut
//                        x: 8
//                        y: -_vbar.position * _textOut.height
//                        width: parent.width-8-_vbar.width
//                        height:  contentHeight
//                        selectByKeyboard: true
//                        selectByMouse: true

////                        text: _mdcore.mdRes
//                        wrapMode: TextEdit.Wrap
//                        textFormat: Text.RichText
//                        font.pixelSize: 12

//                        MouseArea {
//                            anchors.fill: parent
//                            propagateComposedEvents: true
//                            hoverEnabled: true
//                            onWheel:(wheel)=>{
////                                console.log("w轮子滚动"+wheel.angleDelta.y)
//                                if(wheel.angleDelta.y >0){
//                                    _vbar.decrease()
////                                    console.log("y大于0_vbar.height"+_vbar.height)
////                                    console.log("y大于0 _vbar.width"+_vbar.width)
////                                    console.log("y大于0 _vbar.size"+_vbar.size)
////                                    console.log("y大于0 _vbar.position"+_vbar.position)
//                                }
//                                else {
//                                    _vbar.increase()
//                                }
//                            }
//                            onClicked:(mouse)=> {
//                                _textIn.forceActiveFocus();
//                                mouse.accepted = false;
//                            }
//                            onPressed:(mouse)=> {
//                               mouse.accepted = false;
//                            }
//                            onReleased: (mouse)=>{
//                                mouse.accepted = false;
//                            }
//                            onDoubleClicked:(mouse)=> {
//                                mouse.accepted = false;
//                            }
//                            onPositionChanged: (mouse)=>{
//                                mouse.accepted = false;
//                            }
//                            onPressAndHold:(mouse)=> {
//                                mouse.accepted = false;
//                            }
//                        }


//                    }


                }

            }

        }
   }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.66;height:480;width:640}
}
##^##*/
