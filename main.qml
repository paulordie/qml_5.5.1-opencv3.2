import QtQuick 2.5
import QtQuick.Window 2.2
import QtMultimedia 5.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.4
import com.optimusprime.classes 1.0

Window {
    visible: true
    width: 640
    height: 800

    Camera
    {
        id: camera
        imageCapture
        {
            onImageSaved:
            {
                imgProcessor.processImage(path)
            }
        }
    }

    Rectangle {
        id: idRectangleImageDrawer
        width: 640
        height: 480
        radius: 10


        ImageProcessor
        {
            id: imgProcessor
            onImageProcessed:
            {
                imgViewer.setImage(image);
                imageDrawer.paint();
            }
        }
    }

    Rectangle {
        id: idRectangle
        width: 640
        height: 480
        radius: 10

        VideoOutput
        {
            source: camera
            anchors.fill: parent
            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    camera.imageCapture.capture()
                }
            }
            Label
            {
                text: "Take photo"
                color: "green"
            }
        }
    }


    DropArea
    {
        id: imageDrawer
        width: parent.width
        height: parent.height
        ImageViewer
        {
            id: imgViewer
            anchors.fill: parent
            Label
            {
                text: "Swipe to right or left<br> to return to capture!"
                anchors.right: parent
                color: "red"
            }
        }
    }
}
