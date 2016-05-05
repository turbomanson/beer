float birthRate = .8;
float particleCountCurrent= 0;
int particleCount = 300;
float[] y = new float[particleCount];
float[] x = new float[particleCount];
int[] sideCount = new int[particleCount];
float[] radius = new float[particleCount];
float[] speedX= new float[particleCount];
float[] speedY= new float[particleCount];
float[] gravity = new float[particleCount];
float[] dampening = new float[particleCount];
float[] friction = new float[particleCount];
float[] z= new float[particleCount];

void setup(){
  size(300, 600);
  for(int i=0; i<particleCount; i +=1){
  x[i]=random(0,width);
  y[i]=height-10;
  sideCount[i]= int(random(3,10));
  speedX[i]=random(-2.2, 2.2);
  speedY[i]=-1.5;
  z[i]=10;
  radius[i]=random(1, 4);
  gravity[i]=-.09;
  dampening[i]=.77;
  friction[i]=.77;
  }
}
  
  
void draw(){
 background(252,202,95);
  noStroke();
  //polygon(float x, float y, float radius, int sides, float strokeWt, color stokeCol)
  for (int i=0; i<particleCountCurrent; i+=1){
    polygon(x[i], y[i], radius[i], 8, 2, color(230, 200, 39));
    x[i]+=speedX[i];
    speedY[i] += gravity[i];
    y[i]+= speedY[i];
    ellipse(x[i], z[i], 20,20);
    checkCollisions(i);
  } 
  if(particleCountCurrent< particleCount-birthRate){
    particleCountCurrent+=birthRate;
  }
}

void checkCollisions( int i) {
  if(x[i] > width -radius[i]) {
    x[i] = width - radius[i];
    speedX[i] = speedX[i] * -1;
  }
  
  if (x[i] < radius[i]) {
    x[i]=radius[i];
    speedX[i]=speedX[i] * -1;
  }
  
  if(y[i] > height - radius[i]) {
    y[i] =height -radius[i];
    speedY[i] =speedY[i] *-1;
    speedY[i] +=dampening[i];
    speedX[i] += friction[i];
    
  }
}
