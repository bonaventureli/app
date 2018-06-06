#!/bin/bash
(
cat << EOF
char Red=255-39;
char Green=255-40;
char Blue=255-35;
char current[3]={Red,Green,Blue};

#include <Wire.h>

void setup() {
  Wire.begin();                // join i2c bus (address optional for master)
  Serial.begin(9600);          // start serial communication at 9600bps

  Wire.beginTransmission(26); // transmit to device #26
  //Wire.write(byte(0x4B));  //0x4B LED_CURRNET_REG
  Wire.write(byte(0xCB));//0x4B read,0xCB write
  Wire.write(current,3);
  Wire.endTransmission();      // stop transmitting
}

void loop() {
  Wire.beginTransmission(26); // transmit to device #26   
    //Wire.write(byte(0x10)); //0x10 LED_ENABLE_REG
  Wire.write(byte(0x90));//0x10 read, 0x90 write
  Wire.write(byte(0x04));//0x7 ENABLE  0x0 DISABLE
  Wire.endTransmission();      // stop transmitting
 
}
EOF
)>>IIC_DLP_B.ino
