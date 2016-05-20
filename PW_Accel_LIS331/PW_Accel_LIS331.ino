
//Accelerometer X value read as often as possible
//The maximum (peak) is stored
//At a set frequency (currently 80Hz) interrupts occur
//  peak value is sent via Serial
//  peak value is reset

//To do: make an easy way to power down the arduino. Else arduino/acclerometer will slowly burn out?




// Code Functions From https://forum.sparkfun.com/viewtopic.php?f=14&t=28900
// 3-axis Accelerometer
// Sparkfun Electronics Triple Axis Accelerometer Breakout - LIS331
// Arduino UNO

// ToBeChanged: Only Read necesary registers
//              Do not normalize

/* Wiring:
    UNO LIS331

    3.3V VCC
    GND GND
    10 CS 
    11 SDA/SDI
    12 SA0/SDO
    13 SCL/SPC
    */


//TimerOne is not a default Library. https://github.com/PaulStoffregen/TimerOne
#include <TimerOne.h>

#include <SPI.h>
#include <stdlib.h>
#include <stdio.h>

#define SS 10 // Serial Select -> CS on LIS331
#define MOSI 11 // MasterOutSlaveIn -> SDI
#define MISO 12 // MasterInSlaveOut -> SDO
#define SCK 13 // Serial Clock -> SPC on LIS331

#define SCALE 0.0007324; // approximate scale factor for full range (+/-24g)
// scale factor: +/-24g = 48G range. 2^16 bits. 48/65536 = 0.0007324

#define SLEEPPIN 8 //for sleeping

// global acceleration values
double xAcc, yAcc, zAcc;  //Later will change, probably store in int's 
int xVal;
int yVal;
int zVal;
int xPeak;

int xTemp;

short accelAwake;

char inChar;

int peakCount = 0;


void setup()
{
  Serial.begin(115200); //115.2 kHz baud

  // Configure SPI. See LIS331
  SPI_SETUP();

  // Configure accelerometer. See LIS331
  Accelerometer_Setup();
  AccelerometerRange(6);
  //Attaches Interrupt. See InterruptsAndPeaks
  Timer1_Setup();

  accelAwake = 0;
  TIMSK1 = 0;
  pinMode(SLEEPPIN, INPUT); 
}


void loop()
{
  accelAwake = digitalRead(SLEEPPIN);
  TIMSK1 = accelAwake;
  if(accelAwake){
      //peak_update();
    //  printXOnly();
    //  testGetValSpeed();
    //xVal = read_XOnly_V3();
    //printXOnly();
//      peak_update();
  } else {
    delay(5000);
  }
}

//void serialEvent() {
//  while (Serial.available()) {
//    inChar = (char)Serial.read();
//    }
//
//  switch (inChar) {
//    case 'w': //w for wake
//      accelAwake = 1;
//      TIMSK1 = 1;
//      break;
//    case 's': //s for sleep
//      accelAwake = 0;
//      TIMSK1 = 0;
//      break;
//    default :
//    
//      break;
//  }
//  
//}
//
//
//
//

