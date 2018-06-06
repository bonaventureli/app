#!/bin/bash
(
cat << EOF
// I2C SRF10 or SRF08 Devantech Ultrasonic Ranger Finder
// by Nicholas Zambetti <http://www.zambetti.com>
// and James Tichenor <http://www.jamestichenor.net>

// Demonstrates use of the Wire library reading data from the
// Devantech Utrasonic Rangers SFR08 and SFR10

// Created 29 April 2006

// This example code is in the public domain.

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

  Wire.beginTransmission(26); // transmit to device #26
  //Wire.write(byte(0x0B));  //0x0B LED_PWM_POLARITY_REG  //0x01 PWM_POLARITY_NORMAL
  Wire.write(byte(0x8B));//0B read,8B write
  Wire.write(byte(0x00));
  Wire.endTransmission();      // stop transmitting

  Wire.beginTransmission(26); // transmit to device #26   
    //Wire.write(byte(0x10)); //0x10 LED_ENABLE_REG
  Wire.write(byte(0x90));//0x10 read, 0x90 write
  Wire.write(byte(0x07));//0x7 ENABLE  0x0 DISABLE
  Wire.endTransmission();      // stop transmitting

  Wire.beginTransmission(26); // transmit to device #26
  //Wire.write(byte(0x69));  //0x69 Display Mode Selection Command
  Wire.write(byte(0xE9));//0x69 read,0xE9 write
  Wire.write(byte(0x00));//0x0 Video display mode  0x1 Pattern display mode
  Wire.endTransmission();      // stop transmitting

  
  Wire.beginTransmission(26); // transmit to device #26
  //Wire.write(byte(0x07));//0x07 Power Control 
  Wire.write(byte(0x87));//0x07 read,0x87 write
  Wire.write(byte(0x00));//  0 = Normal operations  1 = Standby mode
  Wire.endTransmission();      // stop transmitting

}

int reading = 0;

void loop() {
  Wire.beginTransmission(26); // transmit to device #26   
    //Wire.write(byte(0x10)); //0x10 LED_ENABLE_REG
  Wire.write(byte(0x90));//0x10 read, 0x90 write
  Wire.write(byte(0x04));//0x7 ENABLE  0x0 DISABLE
  Wire.endTransmission();      // stop transmitting

  Wire.beginTransmission(26); // transmit to device #26
  Wire.write(byte(0x4B));      // sets register pointer to echo #1 register (0x02)
  //Wire.write(byte(0x10));
  Wire.endTransmission();      // stop transmitting  
  
  Wire.requestFrom(26, 2);    // request 2 bytes from slave device #26
  if (2 <= Wire.available()) { // if two bytes were received
    reading = Wire.read();  // receive high byte (overwrites previous reading)
    reading = reading << 8;    // shift high byte to be high 8 bits
    reading |= Wire.read(); // receive low byte as lower 8 bits
    Serial.println(reading);   // print the reading
  }
  //Wire.endTransmission();
  delay(250);                  // wait a bit since people have to read the output :)
 
}
EOF
)>> IIC_DLP.ino
