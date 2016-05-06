#define PEAKFREQUENCY 123
#define T_80HZ_us 12500 
#define T_ADJUST 0

#define T_UNDERSAMP_us 12500
#define T_UNDER_ADJUST 62

void Timer1_Setup(){
  Timer1.initialize();
  long T_interrupt = T_80HZ_us + T_ADJUST;
  Timer1.attachInterrupt(peak_ISR, T_interrupt);
}

//This is for the peak retrieval
void peak_ISR(){

  Serial.println(xPeak);  
  peak_reset();
  
}

void peak_update(){    //it is a single line, but if it becomes more complex a function is helpful
  xPeak = max(xPeak,read_XOnly_V3()); //really nothing more to it for now
                                      //peak is the highest value
  
}

void peak_reset(){   
  xPeak = -32752;        //not much to this either
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
