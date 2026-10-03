//instantiate variables and vectors.
int water = 50;
int section = 1;
int randomValuesX[] = {0, 0, 0};
int randomValuesY[] = {0, 0, 0};
PShape bottle;
PShape upArrow;
PShape downArrow;
float mass = 1;
PVector position = new PVector(300, 438);
PVector velocity = new PVector(0, 0);
PVector acceleration = new PVector(0, 0);
boolean mouseDragged = false;
boolean rotate = false;

//setup window size and color, create bottle and two arrows.
void setup() {
  size(600, 600);
  background(0, 0, 255);
  
  bottle = createShape();
  bottle.beginShape();
  bottle.strokeWeight(2);
  bottle.noFill();
  bottle.vertex(0, 0);
  bottle.vertex(5, 0);
  bottle.vertex(5, 5);
  bottle.vertex(15, 15);
  bottle.vertex(15, 60);  
  bottle.vertex(-15, 60);
  bottle.vertex(-15, 15);
  bottle.vertex(-5, 5);
  bottle.vertex(-5, 0);
  bottle.endShape(CLOSE);
  
  upArrow = createShape();
  upArrow.beginShape();
  upArrow.fill(135, 170, 255);
  upArrow.vertex(40, 100);
  upArrow.vertex(10, 160);
  upArrow.vertex(25, 160);
  upArrow.vertex(25, 200);
  upArrow.vertex(55, 200);
  upArrow.vertex(55, 160);
  upArrow.vertex(70, 160);
  upArrow.endShape(CLOSE);
  
  downArrow = createShape();
  downArrow.beginShape();
  downArrow.fill(135, 170, 255);
  downArrow.vertex(40, 360);
  downArrow.vertex(10, 320);
  downArrow.vertex(25, 320);
  downArrow.vertex(25, 260);
  downArrow.vertex(55, 260);
  downArrow.vertex(55, 320);
  downArrow.vertex(70, 320);
  downArrow.endShape(CLOSE);
}

void draw() {
  
  //section 1 refers to start screen.
  if(section == 1) {
    background(0, 0, 255);
    
    triangle(randomValuesX[0], randomValuesY[0], randomValuesX[1], randomValuesY[1], randomValuesX[2], randomValuesY[2]);
  
    fill(255);
    textSize(45);
    textAlign(CENTER);
    text("Bottle Flipping Simulator", 300, 100);
  
    strokeWeight(3);
    rect(200, 200, 200, 100);
  
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("START", 300, 265);
  
    strokeWeight(2);
    fill(150,75,0);
    rect(-1,500,601,100);
  }
  
  //section 2 refers to actual simulation screen.
  if(section == 2) {
    background(255, 255, 255);
    strokeWeight(3);
    fill(0, 0, 0);
    rect(-1, 500, 601, 100);
    waterContent(water);
    bottle(water);
    
    if(upArrow.contains(mouseX, mouseY) && mousePressed && water < 100){
      water = water + 1;
    }
    
    if(downArrow.contains(mouseX, mouseY) && mousePressed && water > 0){
      water = water - 1;
    }
  }
  
}

//mouseReleased is for clicking start button, modifying y velocity, changes mouseDragged to false.
void mouseReleased() {
  if(mouseX >= 200 && mouseX <= 400 && mouseY >= 200 && mouseY <= 300) {
      section = section + 1;
  }
  
  if(mouseDragged == true) {
   velocity.y = -30;
   acceleration.y = 3 + mass;
  }
  
  mouseDragged = false;
}

//mouseDragged modifies velocity.x based on mouse position, changes mouseDragged and rotate to true.
void mouseDragged() {
  velocity.x = mouseX - pmouseX;
  mouseDragged = true;
  rotate = true;
}

//shows up and down arrows, displays water content value.
void waterContent(int water) {
  shape(upArrow);
  shape(downArrow);
  text(water, 40, 246);
}

//does calculations and applies position, velocity, and acceleration for bottle. Sets boundaries for bottle.
void bottle(int water) {
  
  mass = 0.2 * water;
  position.add(velocity);
  velocity.add(acceleration);
  
  pushMatrix();
  translate(position.x, position.y);
  shape(bottle);
  popMatrix();
  
  if(position.y > 438) {
    rotate = false;
    velocity.y = 0;
    velocity.x = 0;
    acceleration.y = 0;
    position.y = 438;
  }
  
  if(position.x > 580) {
    velocity.x = -0.5 * velocity.x;
  }
  
  if(position.x < 20) {
    velocity.x = -0.5 * velocity.x;
  }
  
}
