/*

Object avoidance code by Gabriel Fornaeus
######
More information at http://hax0r.se
 */


#include <Servo.h>
#include "pitches.h"

Servo sensorServo;  // Create servo object to control the front servo with the sensor
Servo gripperServo; // Create servo object to control the middle that controls the gripper

// These constants won't change:
const int sensorPin = A0;    // Pin that the sensor is attached to
const int motorRight[] = {1, 2};
const int enableRPin = 3;
const int motorLeft[] = {4, 5};
const int enableLPin = 6;

// variables
int sensorValue = 0;         // the sensor value
int sensorMin = 1024;        // minimum sensor value
int sensorMax = 0;           // maximum sensor value
int pos = 0;                 // Servo position

// A little song
int melody[]= {
	NOTE_A4, NOTE_G5, NOTE_G4, NOTE_A5, NOTE_G6, NOTE_A5, 0, NOTE_E6, NOTE_C4, NOTE_G4, NOTE_D5};
int noteDurations[] = {
	4, 8, 8, 4, 4, 4, 4, 4, 4, 8, 4 };


void setup() {
	analogWrite(enableLPin,0);
	analogWrite(enableRPin,0);
	motorStop();
  // Turn on LED to signal the start of the calibration period:
	pinMode(13, OUTPUT);
	digitalWrite(13, HIGH);

  // Sets pin 0 to output
	pinMode(0, OUTPUT);

// Attaches the servo on pin 0 to the servo object
	sensorServo.attach(0);
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

// Setup motors
int i;
for(i = 0; i < 2; i++){
	pinMode(motorLeft[i], OUTPUT);
	pinMode(motorRight[i], OUTPUT);
	}
// Play a little melody
	for (int thisNote = 0; thisNote < 11; thisNote++)
	{
		int noteDuration = 1000/noteDurations[thisNote];
		tone(8, melody[thisNote], noteDuration);
		int pauseBetweenNotes = noteDuration * 1.30;
		delay(pauseBetweenNotes);
	}
}


void loop() {
// read the sensor:
	sensorValue = analogRead(sensorPin);

	// apply the calibration to the sensor reading
  // sensorValue = map(sensorValue, sensorMin, sensorMax, 0, 255);

	// in case the sensor value is outside the range seen during calibration
	// sensorValue = constrain(sensorValue, 0, 255);
	analogWrite(enableLPin,255);
	analogWrite(enableRPin,255);
	if (sensorValue >= 350) {
		motorStop();
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
			motorStop();
			turnLeft();
			delay(1500);
			motorStop();
		}
		// If NE is the highest, turn right
		if ( distance == northEast )
		{
			motorStop();
			turnRight();
			delay(1500);
			motorStop();
		}
		else
		{
			motorStop();
			int dir = random(20);
			if ( dir >= 10)
			{
				driveBackward();
				delay(1000);
				motorStop();
				turnRight();
				delay(1000);
				motorStop();
			}
			else
			{
				driveBackward();
				delay(1000);
				motorStop();
				turnLeft();
				delay(1000);
				motorStop();
			}
			motorStop();
		}
	}
	sensorServo.write(90);
	driveForward();
	delay(20);
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
	digitalWrite(motorLeft[0], HIGH);
	digitalWrite(motorLeft[1], LOW);

	digitalWrite(motorRight[0], HIGH);
	digitalWrite(motorRight[1], LOW);
}

void driveBackward(){
	digitalWrite(motorLeft[0], LOW);
	digitalWrite(motorLeft[1], HIGH);

	digitalWrite(motorRight[0], LOW);
	digitalWrite(motorRight[1], HIGH);
}

void motorStop(){
	digitalWrite(motorLeft[0], LOW);
	digitalWrite(motorLeft[1], LOW);

	digitalWrite(motorRight[0], LOW);
	digitalWrite(motorRight[1], LOW);
}


void turnLeft()
{
	digitalWrite(motorLeft[1], LOW);
	digitalWrite(motorLeft[0], HIGH);

	digitalWrite(motorRight[0], LOW);
	digitalWrite(motorRight[1], HIGH);
}

void turnRight()
{
	digitalWrite(motorLeft[1], HIGH);
	digitalWrite(motorLeft[0], LOW);

	digitalWrite(motorRight[0], HIGH);
	digitalWrite(motorRight[1], LOW);
}
