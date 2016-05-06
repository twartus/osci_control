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

#include <SPI.h>
#include <stdlib.h>
#include <stdio.h>

#define SS 10 // Serial Select -> CS on LIS331
#define MOSI 11 // MasterOutSlaveIn -> SDI
#define MISO 12 // MasterInSlaveOut -> SDO
#define SCK 13 // Serial Clock -> SPC on LIS331

#define SCALE 0.0007324; // approximate scale factor for full range (+/-24g)
// scale factor: +/-24g = 48G range. 2^16 bits. 48/65536 = 0.0007324

// global acceleration values
double xAcc, yAcc, zAcc;  //Later will change, probably store in int's
  int xVal ;
  int yVal ;
  int zVal ;

void setup()
{
  Serial.begin(115200); //115.2 kHz baud

  // Configure SPI
  SPI_SETUP();

  // Configure accelerometer
  Accelerometer_Setup();
}


void loop()
{
  readVal(); // get acc values and put into global variables
//  scaleVal();// scale into g's
  Serial.print(xAcc, 3);  // X Accel, 1 decimal place
  Serial.print(",");
  Serial.print(yAcc, 3);
  Serial.print(",");
  Serial.println(zAcc, 3);

  delay(10); //delay 10 ms
}






