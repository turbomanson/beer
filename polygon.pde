void polygon(float x, float y, float radius, int sides, float strokeWt, color strokeCol){;
  //ellipse(x,y,radius*2,radius*2);
  //float x=width/2;
  //float y=width/2;
  float theta=0;
  strokeWeight(strokeWt);
  fill(252,248,232);
  beginShape();
  for (int i = 0; i<sides; i+=1){
    float x2=x+cos(theta)*radius;
    float y2=y+sin(theta)*radius;
    vertex(x2, y2);
    theta+=TWO_PI/sides;
  }
  endShape(CLOSE);
}
