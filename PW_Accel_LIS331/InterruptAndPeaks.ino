#define PEAKFREQUENCY 123
#define T_80HZ_us 12500
#define T_1KHZ_us 1000    //In Use
//#define T_80HZ_us 100000 
#define T_ADJUST 0

#define T_UNDERSAMP_us 12500
#define T_UNDER_ADJUST 62

void Timer1_Setup(){
  Timer1.initialize();
//  long T_interrupt = T_80HZ_us + T_ADJUST;
  Timer1.attachInterrupt(peak_ISR_1k, T_1KHZ_us);
}

//This is for the peak retrieval
void peak_ISR(){

  Serial.println(xPeak);  
  peak_reset();
  
}

void peak_ISR_1k(){
  peak_update();
  
  peakcount += 1;
  
  if (peakcount > 12){
    Serial.println(xPeak);
    peak_reset();
  }
  
}


//

void peak_update(){    //it is a single line, but if it becomes more complex a function is helpful
  xTemp = read_XOnly_V3();
  if (xTemp < 16000){
   xPeak = max(xPeak,read_XOnly_V3()); //really nothing more to it for now
  };
                                      //peak is the highest value
  
}

void peak_reset(){   
  xPeak = -32752;        //not much to this either
//  xPeak = 0;
}


//This is for the undersampled to create a full sine
void Timer1_UnderSamp_Setup(){
  Timer1.initialize();
  long T_interrupt = T_UNDERSAMP_us + T_UNDER_ADJUST;
  Timer1.attachInterrupt(underSamp_ISR, T_interrupt);
}
void underSamp_ISR(){
  Serial.println(read_XOnly_V3());  
  
}
