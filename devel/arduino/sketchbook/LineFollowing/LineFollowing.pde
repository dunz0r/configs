/*
Linefollowing code by Gabriel Fornaeus
######
More information at http://hax0r.se
*/

// Header file for musical lulz
#include "pitches.h"

// For the Pololu Qik motor controller
#include <CompactQik2s9v1.h>
#include <NewSoftSerial.h>
// Setup pins for the motor controller
#define rxPin 8
#define txPin 9
#define rstPin 10

NewSoftSerial mySerial = NewSoftSerial(rxPin,txPin);
CompactQik2s9v1 motor = CompactQik2s9v1(&mySerial,rstPin);


// Pololu QTR sensors
#include <PololuQTRSensors.h>
#define NUM_SENSORS   5     // Number of sensors used
#define TIMEOUT       2500  // Waits for 2500 us for sensor outputs to go low

// Sensors 0 through 5 are connected to digital pins 3 through 7, respectively
PololuQTRSensorsRC qtrrc((unsigned char[]) { 3, 4 , 5, 6, 7 },
  NUM_SENSORS, TIMEOUT);
unsigned int sensorValues[NUM_SENSORS];

void setup()
{
	// Setup motors
	mySerial.begin(9600);
	motor.begin();
	delay(200);
	motor.stopBothMotors();
  digitalWrite(13, HIGH);

  delay(500);
  int i;
  for (i = 0; i < 200; i++)  // Make the calibration take about 5 seconds
	{
	    if (i < 20 || i >= 60)
		{
	    	motor.motor0Forward(70);
	    	motor.motor1Reverse(70);
		}
		else
		{
	    	motor.motor1Forward(70);
	    	motor.motor0Reverse(70);
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
		tone(11, NOTE_A4);
		motor.stopBothMotors();
		motor.motor0Forward(100);
		motor.motor1Reverse(100);
	}
	// We're kind of in the middle of the line, drive forwards
	else if(position < 3000)
	{
		motor.motor0Forward(100);
		motor.motor1Forward(100);
	}
	else // If nothing else fits, we're to the left, turn right
	{
		tone(11, NOTE_C4);
		motor.stopBothMotors();
		motor.motor0Reverse(100);
		motor.motor1Forward(100);
	}
}
