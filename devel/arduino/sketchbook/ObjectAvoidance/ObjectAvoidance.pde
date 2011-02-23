/*

Object avoidance code by Gabriel Fornaeus
######
More information at http://hax0r.se
 */


// Servo control
#include <Servo.h>
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

Servo sensorServo;  // Create servo object to control the front servo with the sensor
Servo gripperServo; // Create servo object to control the middle that controls the gripper

// These constants won't change:
const int sensorPin = A0;    // Pin that the sensor is attached to
const int bumpPin = 12;

// variables
int sensorValue = 0;         // the sensor value
int sensorMin = 1024;        // minimum sensor value
int sensorMax = 0;           // maximum sensor value
int pos = 0;                 // Servo position
int bumpState = 0;

// A little song
int melody[]= {
	NOTE_A4, NOTE_G5, NOTE_G4, NOTE_A5, NOTE_G6, NOTE_A5, 0, NOTE_E6, NOTE_C4, NOTE_G4, NOTE_D5};
int noteDurations[] = {
	4, 8, 8, 4, 4, 4, 4, 1, 4, 1, 4 };


void setup() {
// Setup motors
	mySerial.begin(9600);
	motor.begin();
	delay(200);
// Turn on LED to signal the start of the calibration period:
	pinMode(13, OUTPUT);
	digitalWrite(13, HIGH);
// Set the bumpPin to INPUT
	pinMode(bumpPin, INPUT);

// Attaches the servo on pin 0 to the servo object
	sensorServo.attach(2);
	// Center servo
	sensorServo.write(90);
  // Calibrate during the first four seconds
	while (millis() < 4000) {
		sensorValue = analogRead(sensorPin);

    // record the maximum sensor value
	if (sensorValue > sensorMax) {
		sensorMax = sensorValue;
	}

    // record the minimum sensor value
	if (sensorValue < sensorMin) {
		sensorMin = sensorValue;
		}
	}

  // Signal the end of the calibration period
	digitalWrite(13, LOW);


/*
// Play a little melody
	for (int thisNote = 0; thisNote < 11; thisNote++)
	{
		int noteDuration = 1000/noteDurations[thisNote];
		tone(8, melody[thisNote], noteDuration);
		int pauseBetweenNotes = noteDuration * 1.30;
		delay(pauseBetweenNotes);
	}
	*/
}


void loop() {
// read the sensor:
	sensorValue = analogRead(sensorPin);
	bumpState = digitalRead(bumpPin);
	if( bumpState == HIGH)
	{ 
		motorStop();
		driveBackward();
		delay(1000);
		turnLeft();
		delay(1000);
		motorStop();
	}

	// apply the calibration to the sensor reading
  // sensorValue = map(sensorValue, sensorMin, sensorMax, 0, 255);

	// in case the sensor value is outside the range seen during calibration
	// sensorValue = constrain(sensorValue, 0, 255);
	if (sensorValue >= 350) {
		motorStop();
		// Read N
		sensorServo.write(90);
		delay(500);
		int north = analogRead(sensorPin);
		// Read NW
		sensorServo.write(160);
		delay(500);
		int northWest = analogRead(sensorPin);
		// Read NE
		sensorServo.write(25);
		delay(500);
		int northEast = analogRead(sensorPin);
		// Determine which direction has the lowest value
		int distance = min(northWest,northEast);
		// If NW is the lowest, turn left
		if ( distance == northWest)
		{
			tone(11, NOTE_G4, 200);
			motorStop();
			delay(3);
			turnRight();
			delay(1500);
			motorStop();
		}
		// If NE is the highest, turn right
		if ( distance == northEast )
		{
			tone(11, NOTE_C4, 200);
			motorStop();
			delay(3);
			turnLeft();
			delay(1500);
			delay(3);
			motorStop();
		}
		if ( distance == north )
		{
			tone(11, NOTE_A4, 200);
			motorStop();
			delay(3);
			driveBackward();
			delay(1000);
			turnLeft();
			delay(1000);
			motorStop();
		}
	}
	driveForward();
	delay(10);
	sensorServo.write(90);
}

void servoSweep()
{
	for(pos = 0; pos < 180; pos += 1)  // goes from 0 degrees to 180 degrees 
		{                                  // in steps of 1 degree 
		sensorServo.write(pos);              // tell servo to go to position in variable 'pos' 
		delay(10
		);                       // waits 15ms for the servo to reach the position 
		}
	for(pos = 180; pos>=1; pos-=1)     // goes from 180 degrees to 0 degrees 
	{
		sensorServo.write(pos);              // tell servo to go to position in variable 'pos' 
		delay(10);                       // waits 15ms for the servo to reach the position 
	}
}

void driveForward()
{
	motor.motor0Forward(100);
	motor.motor1Forward(100);
}

void driveBackward()
{
	motor.motor0Reverse(100);
	motor.motor1Reverse(100);
}

void motorStop()
{
	motor.stopBothMotors();
}


void turnLeft()
{
	motor.stopBothMotors();
	motor.motor0Forward(100);
	motor.motor1Reverse(100);
}

void turnRight()
{
	motor.stopBothMotors();
	motor.motor1Forward(100);
	motor.motor0Reverse(100);
}
