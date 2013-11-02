import processing.serial.*;
 
Serial myPort; //serial port  
String[] commands = new String[9];

void setup() 
{
  size(16, 16);
  println(Serial.list()); //print serial devices to the console
  String portName = Serial.list()[4]; //usually the arduino is index 4 or 5
  myPort = new Serial(this, portName, 57600); //connect to the arduino
  
  //x-y-z position where you want the arm to go (in order)
  commands[0]="G00 X0 Y0 Z3 F40;";
  commands[1]="G00 X0 Y0 Z0 F40;";
  commands[2]="G00 X0 Y5 Z0 F40;";
  commands[3]="G00 X0 Y5 Z3 F40;";
  commands[4]="G00 X0 Y5 Z0 F40;";
  commands[5]="G00 X5 Y5 Z0 F40;";
  commands[6]="G00 X5 Y5 Z3 F40;";
  commands[7]="G00 X5 Y5 Z0 F40;";
  commands[8]="G00 X0 Y0 Z0 F40;";
  
  noLoop();
}
 
void draw() {
  while(true){
    for(int i = 0 ; i < 9; i++){
      myPort.write(commands[i]);
      delay(10);
    }
  }
}
