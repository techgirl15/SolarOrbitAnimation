void setup() {
  size(1280,800,P3D);
}

float counter = 0;

float camAngle = 0.0;
float camHeight = 0.0;
float camRadius = 300.0;
void keyPressed() {
  if (key == CODED) {
    
  }
}


void draw(){
  
    if (keyPressed) 
    {
          if (key == 'w' && camRadius > 0) 
          {
            camRadius -= 20;
          } 
          if (key == 's' && camRadius < 2000) 
          {
            camRadius += 20;
          }
          
          if (key == 'a') 
          {
            camAngle += 0.02;
          }

          if (key == 'd') 
          {
            camAngle -= 0.02;
          } 
          
          if(key == ' '){
            camHeight -= 20;
          }
          if(keyCode == SHIFT){
            camHeight += 20;
          }
    }
  
  camera(width/2.0+camRadius*cos(camAngle), height/2.0+camHeight, camRadius*sin(camAngle), width/2.0, height/2.0, 0, 0, 1, 0);
  //camera(width/2.0, height/2.0-300, (height/2.0) / tan(PI*50.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  //camera(width/2.0+1000*cos(counter), height/2.0, sin(counter)*1000+(height/2.0) / tan(PI*10.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  translate(640,400,0);
  println(cos(counter)*1000 + " , " + sin(counter)*1000 + " , " + counter%(2*PI));
  background(0,0,0);
  lights();
  strokeWeight(0);
  
  //axes
  stroke(0,255,0);
  strokeWeight(2.0);
  line(0,0,0,200,0,0);//X-axis
  line(0,0,0,0,200,0);//Y-axis
  line(0,0,0,0,0,200);//Z-axis
  strokeWeight(0);
  
  //Sun
  fill(255,255,0);
  sphere(100);
  
  //Planet
  pushMatrix();
  fill(0,0,255);
  translate(200*cos(counter),0,200*sin(counter));
  sphere(10);
  popMatrix();
  counter += 0.01;
}