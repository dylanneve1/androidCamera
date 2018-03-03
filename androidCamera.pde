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
import android.app.Activity;
import android.content.Context;

Context context;
KetaiCamera cam;
Activity act;

PImage newImage;

void setup()
{
  noStroke();
  size(displayWidth, displayHeight, P2D);
  orientation(LANDSCAPE);
  imageMode(CORNER);
  cam = new KetaiCamera(this, width, height, 60);
}

void draw()
{
  background(#212121);
  fill(#EEEEEE);
  ellipse((displayWidth/8)*7, (displayHeight/2)*7, displayWidth*0.2, displayWidth*0.2);
  if(cam.isStarted())
  {
    image(cam, 0, 0, (displayWidth/4)*3, displayHeight/4);
  } else {
    cam.start();
  }
  if(mousePressed == true)
  {
    newImage = cam.get();
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