#define TIMINGTESTPIN 7

////////////////////////////////////////////////
//////////For Debugging, print X Y and Z////////
////////////////////////////////////////////////
void printXYZ(){  //For debugging
  readVal(); // get acc values and put into global variables
  Serial.print(xAcc, 3);  // X Accel, 1 decimal place
  Serial.print(",");
  Serial.print(yAcc, 3);
  Serial.print(",");
  Serial.println(zAcc, 3);

  delay(10); //delay 10 ms
}


////////////////////////////////////////////////
//////////For Debugging, prints X only////////
////////////////////////////////////////////////
void printXOnly(){  //also for debugging
  read_XOnly_V2();
  Serial.println(xVal);
  //Serial.println((unsigned int)xVal,HEX);

  //delay(10);
}


////////////////////////////////////////////////
//////////Put in loop alone, observe frequency of CS
//////////When find, record
////////////////////////////////////////////////
void testGetValSpeed(){ 
  xVal = read_XOnly_V3();
}


////////////////////////////////////////////////
////////For Testing Interrupt Timing////////
////////////////////////////////////////////////
void testInterruptTiming(){ 
  digitalWrite(TIMINGTESTPIN, HIGH);  //Observe Pin 7 for Interrupt Frequency
  delay(1);
  digitalWrite(TIMINGTESTPIN, LOW);
}



