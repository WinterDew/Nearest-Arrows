class Arrow {
  PVector location;
  PVector target;
  PVector arrow;
  float len;
  
  Arrow(PVector location_,PVector target_,float len_){
    this.location = location_;
    this.target = target_;
    this.len = len_;
  }
  void show() {
    float angle = PVector.sub(target,location).heading();
    this.target = PVector.add(location,new PVector(1,1).setMag(this.len).setHeading(angle));
    this.arrow = PVector.sub(target,location);

    pushMatrix();
    fill(0);
    stroke(0);
    strokeCap(ROUND);
    translate(this.location.x,this.location.y);
    strokeWeight(3);
    line(0,0,this.arrow.x,this.arrow.y);
    strokeWeight(2);
    circle(0,0,7);
    translate(this.arrow.x,this.arrow.y);
    rotate(this.arrow.heading());
    rotate(PI);
    rotate(PI/8);
    strokeWeight(3);
    line(0,0,5,0);
    rotate(-PI/4);
    line(0,0,5,0);
 
    popMatrix();
    
  }
}
