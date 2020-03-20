import javax.script.ScriptEngineManager;
import javax.script.ScriptEngine;
import javax.script.ScriptException;
import controlP5.*;
ControlP5 cp5; //<>//

Textfield xMaxTextField; //<>//
Textfield InputYTextField;
Textfield xMinTextField; 
Textfield xValTextField;

ScriptEngine engine; //<>//
String foo; //<>//
String mySentence = "test";
float VectorY;
int sum;
float min;
float max;
float x_val = min;
float startx_val;
float sum_areal;
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
  xValTextField = cp5.addTextfield("xVal")
  .setPosition(0.75*width,0.40*height)
  .setSize(200,50)
  .setFocus(true).setFont(font)
  .setText("0.1");
  

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
  x_val = Float.parseFloat(xValTextField.getText());

  foo = InputYTextField.getText();
  liste.clear();
  startx_val=min;

  while (startx_val <= max) {
      
    String foo2 = foo.replace("x", ""+x_val);
    println("vi er i loopet!" + foo2);
    try {
      
      float y = Float.parseFloat(engine.eval(foo2).toString());
      PVector p = new PVector(x_val, y);
      liste.add(p);
      println(engine.eval(foo2));
      startx_val+=x_val;
      sum_areal+=y*startx_val;
      println("Sum-areal "+sum_areal); //<>//
       println("X-VAL "+startx_val);
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
