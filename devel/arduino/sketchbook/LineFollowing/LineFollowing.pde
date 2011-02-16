#include <PololuQTRSensors.h>

// This example is designed for use with eight QTR-1RC sensors or the eight sensors of a
// QTR-8RC module.  These reflectance sensors should be connected to digital inputs 3 to 10.
// The emitter control pin can optionally be connected to digital pin 2, or you can leave
// it disconnected and change the EMITTER_PIN #define below from 2 to QTR_NO_EMITTER_PIN.

// The setup phase of this example calibrates the sensor for ten seconds and turns on
// the pin 13 LED while calibration is going on.  During this phase, you should expose each
// reflectance sensor ot the lightest and darkest readings they will encounter.  For
// example, if you are making a line follower, you should slide the sensors across the
// line during the calibration phase so that each sensor can get a reading of how dark the
// line is and how light the ground is.  Improper calibration will result in poor readings.
// If you want to skip the calibration phase, you can get the raw sensor readings
// (pulse times from 0 to 2500 us) by calling qtra.read(sensorValues) instead of
// qtra.readLine(sensorValues).

#define NUM_SENSORS   6     // Number of sensors used
#define TIMEOUT       2500  // Waits for 2500 us for sensor outputs to go low

// Sensors 0 through 5 are connected to digital pins 8 through 13, respectively
PololuQTRSensorsRC qtrrc((unsigned char[]) {8, 9, 10, 11, 12, 13},
  NUM_SENSORS, TIMEOUT);
unsigned int sensorValues[NUM_SENSORS];

// Setup motors
const int motorRight[] = {2, 3};
//const int enableRPin = 3;
const int motorLeft[] = {5, 6};
//const int enableLPin = 6;

void setup()
{
  // Stop the motors, to be sure
  stop();

  delay(500);
  int s;
  for (s = 0; s < 400; s++)  // Make the calibration take about 10 seconds
  {
    qtrrc.calibrate();       // Reads all sensors 10 times at 2500 us per read (i.e. ~25 ms per call)
  }
// Setup motors
	int m;
	for(m = 0; m < 2; m++)
	{
		pinMode(motorLeft[m], OUTPUT);
		pinMode(motorRight[m], OUTPUT);
	}


}


void loop()
{
  unsigned int position = qtrrc.readLine(sensorValues);
  if (position > 3000 ) // Line is to the left
  { 
  	  turnLeft();
  }
  if (position < 3000)  // Line is to the Right
	{
		turnRight();
	}
 driveForward();
 delay(1);
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

void stop(){
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
