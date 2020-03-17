import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import javax.script.ScriptException;
import controlP5.*;
ControlP5 cp5; //<>//

Textfield xMaxTextField; //<>//
Textfield InputYTextField;
Textfield xMinTextField; 

ScriptEngine engine; //<>//
String foo; //<>//
String mySentence = "test";
float VectorY;
int sum;
float min;
float max;
float x_val = min;
ArrayList<PVector> liste = new ArrayList<PVector>() ; 

void setup() {
  println("her er vi"); //<>//
  foo = "x*x"; //<>//

  // String ff = foo.replace("x","xVal");
  //Tekstfelt
  fullScreen();
  // size(FULLSCREEN);
  PFont font = createFont("arial", 30);
  textFont(font);
  cp5 = new ControlP5(this); //<>//
  xMaxTextField = cp5.addTextfield("xMaxTextField")
    .setPosition(0.75*width, 0.25*height)
    .setSize(200, 50)
    .setFocus(true).setFont(font)
    .setText("3");
  InputYTextField= cp5.addTextfield("InputYTextField")
    .setPosition(0.9*width, 0.4*height)
    .setSize(200, 50)
    .setFocus(true).setFont(font)
    .setText("x*x+1");
  xMinTextField = cp5.addTextfield("xMinTextField")
    .setPosition(0.90*width, 0.25*height)
    .setSize(200, 50)
    .setFocus(true).setFont(font)
    .setText("1");
  cp5.addBang("Evaluate").setPosition(0.90*width, 0.50*height).setSize(100, 50);

  //Beregning
  ScriptEngineManager mgr = new ScriptEngineManager(); //<>//
  engine = mgr.getEngineByName("JavaScript");
  //While loop
  //  println(ff);
}

void Evaluate() {
  fill(255);
  rect(0,0,0.5*width,height);
  min = Float.parseFloat(xMinTextField.getText());
  max = Float.parseFloat(xMaxTextField.getText());
 
  foo = InputYTextField.getText();
  liste.clear();
  x_val=min;
  while (x_val <= max) {

    String foo2 = foo.replace("x", ""+x_val);
    
    println("vi er i loopet!" + foo2);
    try {
      float y = Float.parseFloat(engine.eval(foo2).toString());
      PVector p = new PVector(x_val, y);
      liste.add(p);
      println(engine.eval(foo2));
      float value=x_val*p.y;
      println("Det her er den anden value"+value);
      x_val+=0.01; //<>//
    }
    catch(ScriptException e) {
    }
  
   
    for (PVector pp : liste) {  
       pushMatrix();
       translate(0.25*width,0.5*height);
       scale(-1);
      fill(0);
      circle(-pp.x*10,pp.y*10,10);
      popMatrix();
      
    }
    
    
  }
  
  for (PVector p : liste) {
    sum += p.y;
  }
    for (PVector pp : liste) {
      pushMatrix();
      translate(0.25*width,0.5*height);
      rotate(PI);
      float bredde = pp.x+x_val;
      fill(0);
      rect(-pp.x,pp.y,-bredde*10,(pp.y)*10);
      popMatrix();
    }
      println(sum); 
    }
 

void draw() {
  text("",150,50);

}
