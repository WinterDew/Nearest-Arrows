// Tatva Agarwal 05-Jul-2023
//https://junkiyoshi.com/openframeworks20230123/

ArrayList<Arrow> arrows;
ArrayList<Particle> particles;
int radius = 0;
final int COUNT = 50;
final float STEP_ANGLE = (2*PI)/COUNT;
int padding = 50;

ArrayList<PVector> targets;

void setup(){
 size(720,720);
 //randomSeed(39);
 windowResizable(false);
 radius = floor(height/2) - padding;
 targets = new ArrayList<PVector>();
 particles = new ArrayList<Particle>();
 arrows = new ArrayList<Arrow>();
 for (int i = 1; i <= COUNT; i++){
   PVector location = new PVector(radius,0).rotate(STEP_ANGLE*i);
   //PVector target = new PVector(random(-radius,radius),random(-radius,radius));
   PVector target = new PVector(0,0);

   arrows.add(new Arrow(location,target,PVector.dist(target,location)-padding));
  }
 for (int i = 1; i <= floor(COUNT/10); i++){
   particles.add(new Particle(new PVector(random(-radius,radius),random(-radius,radius)),radius));
 }
}

void draw(){
  frameRate(60);
  background(255);
  noFill();
  translate(width/2,height/2);
  
  //debug
  //pushMatrix();
  //strokeWeight(5);
  //stroke(0,70);
  //circle(0,0,radius*2);
  //popMatrix();
  //debug/
  
  for (Particle particle: particles){
    particle.show();
  }
  
  
  
  for (Arrow arrow : arrows){
   PVector target = new PVector(0,0);
   float leastDistance = 1000;
   for (Particle particle: particles){
     float distance = PVector.dist(particle.position,arrow.location);
     if(distance <= leastDistance){
       leastDistance = distance;
       target = particle.position;
     }
   }
   arrow.target = target;
   arrow.len = leastDistance - padding;
   arrow.show(); 
  }
  
  //saveFrame("./Export/Frames/####.tif");
  //if (millis()/1000 > 30){
  // exit(); 
  //}
}
