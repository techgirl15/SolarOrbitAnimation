static final int EarthPeriodSec = 1;
static final float JupiterPeriodYears = 11.86;
static final float earthAxes[] = {149.6,149.58};//Semi major then semi minor
static final float DistanceToSun = sqrt( earthAxes[0]*earthAxes[0] - earthAxes[1]*earthAxes[1]);//Distance to sun from center of orbit
void setup() {
  size(1280,800,P3D);
  frameRate(30);//
}

float counter = 0;

float camAngle = 0.0;
float camHeight = 0.0;
float camRadius = 300.0;
void drawCircle(float a, float b, float x, float y, float z){
  stroke(255,255,255);
  noFill();
  strokeWeight(1);
  beginShape();
  for(int i = 0; i < 37; i++){
    vertex(a*cos(PI/18*i), y, b*sin(PI/18*i));
  }
  endShape();
  noStroke();
}

void draw(){
  
    if (keyPressed) 
    {
          if (key == 'w' && camRadius > 20) 
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
  //Camera
  camera(width / 2.0+camRadius * cos(camAngle), height / 2.0 + camHeight, camRadius * sin(camAngle), width / 2.0, height / 2.0, 0, 0, 1, 0);
  //camera(width/2.0, height/2.0-300, (height/2.0) / tan(PI*50.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  //camera(width/2.0+1000*cos(counter), height/2.0, sin(counter)*1000+(height/2.0) / tan(PI*10.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  translate(640,400,0);
  println(cos(counter) * 1000 + " , " + sin(counter) * 1000 + " , " + counter % (2 * PI));
  background(0,0,0);
  lights();
  strokeWeight(0);
  
  //axes
  stroke(0, 255, 0);
  strokeWeight(2.0);
  line(0, 0, 0, 200, 0, 0);//X-axis
  line(0, 0, 0, 0, 200, 0);//Y-axis
  line(0, 0, 0, 0, 0, 200);//Z-axis
  strokeWeight(0);
  
  //Sun
  fill(255, 255, 0);
  sphere(50);
  
  //Earth
  drawCircle(149.6, 149.58, 0, 0, 0);
  pushMatrix();
  fill(0,0,255);
  translate(earthAxes[0] * cos(counter) + DistanceToSun, 0, earthAxes[1] * sin(counter));
  sphere(5);
  popMatrix();
  
  //Jupiter
  pushMatrix();
  fill(255,69,0);
  translate(778 * cos(counter / JupiterPeriodYears), 0, 778 * sin(counter / JupiterPeriodYears));
  sphere(10);
  popMatrix();
  counter += 2 * PI / frameRate / EarthPeriodSec;//150 frames/30 fps is 6 second orbital period. 6 seconds is a year
}