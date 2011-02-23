/*
Linefollowing code by Gabriel Fornaeus
######
More information at http://hax0r.se
*/

// Header file for musical lulz
#include "pitches.h"
// Servo control
#include <Servo.h>

// For the Pololu Qik motor controller
#include <CompactQik2s9v1.h>
#include <NewSoftSerial.h>
// Setup pins for the motor controller
#define rxPin 8
#define txPin 9
#define rstPin 10

NewSoftSerial mySerial = NewSoftSerial(rxPin,txPin);
CompactQik2s9v1 motor = CompactQik2s9v1(&mySerial,rstPin);

Servo sensorServo; // Create object to control the front servo with the sensor
// Pololu QTR sensors
#include <PololuQTRSensors.h>
#define NUM_SENSORS   3     // Number of sensors used(actually five, but we'll skip the outer two)
#define TIMEOUT       2500  // Waits for 2500 us for sensor outputs to go low

// Sensors 0 through 5 are connected to digital pins 4 through 6, respectively
PololuQTRSensorsRC qtrrc((unsigned char[]) { 4 , 5, 6, },
  NUM_SENSORS, TIMEOUT);
unsigned int sensorValues[NUM_SENSORS];

void setup()
{
	// Don't want the servo to be off center, even though we'e not using it
	sensorServo.attach(2);
	sensorServo.write(90);
	// Setup motors
	mySerial.begin(9600);
	motor.begin();
	delay(200);
	motor.stopBothMotors();
  digitalWrite(13, HIGH);

  delay(500);
  int i;
  for (i = 0; i < 400; i++)  // Make the calibration take about 10 seconds
	{
	    if (i < 20 || i >= 60)
		{
	    	motor.motor0Forward(100);
	    	motor.motor1Reverse(100);
		}
		else
		{
	    	motor.motor1Forward(100);
	    	motor.motor0Reverse(100);
		}
    qtrrc.calibrate();       // Reads all sensors 10 times at 2500 us per read (i.e. ~25 ms per call)
	}
  digitalWrite(13, LOW);
}


void loop()
{
	unsigned int position = qtrrc.readLine(sensorValues);
	unsigned char i;

	// We're far to the right of the line, turn left
	if (position < 1000)
	{
		motor.motor0Forward(100);
		motor.motor1Reverse(100);
	}
	// We're in the middle of the line, drive forwards
	else if(position < 3000)
	{
		digitalWrite(13, HIGH);
		motor.motor0Forward(100);
		motor.motor1Forward(100);
	}
	else // If nothing else fits, we're to the left, turn right
	{
		motor.motor0Reverse(100);
		motor.motor1Forward(100);
	}
}
