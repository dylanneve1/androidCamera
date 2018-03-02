import ketai.camera.*;
import ketai.cv.facedetector.*;
import ketai.data.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.net.nfc.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.sensors.*;
import ketai.ui.*;

KetaiCamera cam;

PImage newImage;

void setup()
{
  noStroke();
  size(displayWidth, displayHeight, P2D);
  orientation(PORTRAIT);
  imageMode(CORNER);
  cam = new KetaiCamera(this, width, height, 60);
}

void draw()
{
  background(#212121);
  fill(#EEEEEE);
  ellipse(displayWidth/2, (displayHeight/8)*7, displayWidth*0.2, displayWidth*0.2);
  if(cam.isStarted())
  {
    //translate(width, height/2);
    //rotate(HALF_PI);
    image(cam, 0, 0, displayWidth, (displayHeight/4)*3);
  } else {
    cam.start();
  }
  if(mousePressed == true)
  {
    newImage = cam.get();
    // image(newImage, 0, 0, displayWidth, displayHeight);
  }
}

void onCameraPreviewEvent()
{
  cam.read();
}

void exit()
{
  cam.stop();
}