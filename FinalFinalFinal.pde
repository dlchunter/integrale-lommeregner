import javax.script.ScriptEngineManager;


import javax.script.ScriptEngine;


import javax.script.ScriptException;


import controlP5.*;


ControlP5 cp5;





Textfield xMaxTextField;


Textfield InputYTextField;


Textfield xMinTextField; 


Textfield xValTextField;





ScriptEngine engine;


String y_val;


String mySentence = "test";


float VectorY;


int sum;


float min;


float max;


float x_val = min;


float x;


float sum_areal;


ArrayList<PVector> liste = new ArrayList<PVector>() ; 





void setup() {


  println("her er vi");


  y_val = "x*x";





  // String ff = foo.replace("x","xVal");


  //Tekstfelt


  fullScreen();


  // size(FULLSCREEN);


  PFont font = createFont("arial", 30);


  textFont(font);


  cp5 = new ControlP5(this);


  xMaxTextField = cp5.addTextfield("xMax")


    .setPosition(0.75*width, 0.25*height)


    .setSize(200, 50)


    .setFocus(true).setFont(font)


    .setText("3");


  InputYTextField= cp5.addTextfield("Funktion")


    .setPosition(0.9*width, 0.4*height)


    .setSize(200, 50)


    .setFocus(true).setFont(font)


    .setText("x*x+1");


  xMinTextField = cp5.addTextfield("xMin")


    .setPosition(0.9*width, 0.25*height)


    .setSize(200, 50)


    .setFocus(true).setFont(font)


    .setText("1");


  cp5.addBang("Evaluate")


  .setPosition(0.90*width, 0.50*height).


  setSize(100, 50);


  xValTextField = cp5.addTextfield("xVal")


  .setPosition(0.75*width,0.40*height)


  .setSize(200,50)


  .setFocus(true).setFont(font)


  .setText("0.1");


  //Beregning


  ScriptEngineManager mgr = new ScriptEngineManager();


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


  y_val = InputYTextField.getText();


  liste.clear();


  sum_areal= 0;


  x=min;





  while (x <= max) {


    String y_valF = y_val.replace("x", ""+x);


    println("vi er i loopet!" + y_valF);


    try {





      float y = Float.parseFloat(engine.eval(y_valF).toString());


      PVector p = new PVector(x_val, y);


      liste.add(p);


      println(engine.eval(y_valF));


      x+=x_val;


      sum_areal= sum_areal + y*x_val;


      println("Sum_areal!! " + sum_areal);


    }





    catch(ScriptException e) {


    }





  }


  float ymax = 0;


  float ymin = 0;


    for (int i = 0; i < liste.size(); i++) {


      if(liste.get(i).y<ymin)


      ymin=liste.get(i).y;


      if(liste.get(i).y>ymax)


        ymax=liste.get(i).y;      


    }





  PVector coordinatescale = new PVector((width/3)/(max-min),(height/2)/(ymax-ymin));


      pushMatrix();


      translate(0.05*width,0.9*height+ymin*coordinatescale.y);


  for (int i = 0; i < liste.size(); i++) {


    float xval = liste.get(i).x + x_val*(float)i;


    println("" + xval);


    rectMode(CORNER);


    fill(0);


    rect(xval*coordinatescale.x,-liste.get(i).y*coordinatescale.y,x_val*coordinatescale.x,liste.get(i).y*coordinatescale.y);


    fill(0);


  }


    popMatrix();


}





void draw() {


  text("",150,50);


  text("Areal: "+sum_areal,150,150);


  fill(0,102,153);


  }
