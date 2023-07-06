class Particle{
  int radius = 20;
  float boundRadius;
  PVector position;
  float x_off = random(10000);
  float y_off = random(10000);
  
  Particle(PVector position_,float boundRadius_){
    this.position = position_;
    this.boundRadius = boundRadius_;
  } 
  
  void update(){
   
   this.position = new PVector(map(noise(x_off),0,1,-boundRadius,boundRadius),map(noise(y_off),0,1,-boundRadius,boundRadius));
   this.x_off += 0.007 * random(2);
   this.y_off += 0.007 * random(2);
  }
  
  void show(){
    this.update();
    pushMatrix();
    fill(0);
    noStroke();
    circle(this.position.x,this.position.y, 12);
    popMatrix();
  }
  
}
