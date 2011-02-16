  const int switchPin = 2;    // switch input

  // Left Motor
  const int enableLPin = 3;    // H-bridge enable (pin 9, 3/4 en)
  const int motorL1Pin = 5;    // H-bridge leg 1 (pin 2, 1A)
  const int motorL2Pin = 4;    // H-bridge leg 2 (pin 7, 2A)

    // Right Motor
  const int enableRPin = 6;    // H-bridge enable (pin 1, 1/2 en)
  const int motorR1Pin = 8;    // H-bridge leg 3 (pin 15, 4A)
  const int motorR2Pin = 7;    // H-bridge leg 4 (pin 10, 3A)
  
  const int ledPin = 13;      // LED 

  void setup() {
    // set all the other pins you're using as outputs:
    pinMode(motorL1Pin, OUTPUT); 
    pinMode(motorL2Pin, OUTPUT); 
    pinMode(enableLPin, OUTPUT);
    pinMode(ledPin, OUTPUT);
    
    pinMode(motorR1Pin, OUTPUT); 
    pinMode(motorR2Pin, OUTPUT); 
    pinMode(enableRPin, OUTPUT);


    // set enablePin high so that motor can turn on:
    analogWrite(enableLPin, 75); 
    analogWrite(enableRPin, 75); 

    // blink the LED 3 times. This should happen only once.
    // if you see the LED blink three times, it means that the module
    // reset itself,. probably because the motor caused a brownout
    // or a short.
    blink(ledPin, 3, 100);
  }

  void loop() {
      analogWrite(enableLPin, 200);
      analogWrite(enableRPin, 200);
      digitalWrite(motorL1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorL2Pin, HIGH);  // set leg 2 of the H-bridge high
      digitalWrite(motorR1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorR2Pin, HIGH);  // set leg 2 of the H-bridge high
      Serial.println("1");
      blink(ledPin, 3, 200);
      delay(1000);
      digitalWrite(motorL1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorL2Pin, LOW);  // set leg 2 of the H-bridge high
      digitalWrite(motorR1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorR2Pin, LOW);  // set leg 2 of the H-bridge high
      blink(ledPin, 3, 300);
      Serial.println("4");
      delay(1000);
      analogWrite(enableLPin, 75);
      analogWrite(enableRPin, 75);
      digitalWrite(motorL1Pin, HIGH);  // set leg 1 of the H-bridge high
      digitalWrite(motorL2Pin, LOW);   // set leg 2 of the H-bridge low
      digitalWrite(motorR1Pin, HIGH);  // set leg 1 of the H-bridge high
      digitalWrite(motorR2Pin, LOW);   // set leg 2 of the H-bridge low
      blink(ledPin, 3, 400);
      Serial.println("2");
      delay(2000);
      digitalWrite(motorL1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorL2Pin, LOW);  // set leg 2 of the H-bridge high
      digitalWrite(motorR1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorR2Pin, LOW);  // set leg 2 of the H-bridge high
      Serial.println("3");
      delay(1000);
      blink(ledPin, 3, 500);
      analogWrite(enableLPin, 200);
      digitalWrite(motorL1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorL2Pin, HIGH);  // set leg 2 of the H-bridge high
      digitalWrite(motorR1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorR2Pin, HIGH);  // set leg 2 of the H-bridge high
      delay(1000);
      blink(ledPin, 3, 600);
      Serial.println("5");
      analogWrite(enableLPin, 255);
      analogWrite(enableRPin, 255);
      digitalWrite(motorL1Pin, HIGH);  // set leg 2 of the H-bridge high
      digitalWrite(motorL2Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorR1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motorR2Pin, HIGH);  // set leg 2 of the H-bridge high
      delay(1000);
      blink(ledPin, 3, 600);
     }

  /*
    blinks an LED
   */
  void blink(int whatPin, int howManyTimes, int milliSecs) {
    int i = 0;
    for ( i = 0; i < howManyTimes; i++) {
      digitalWrite(whatPin, HIGH);
      delay(milliSecs/2);
      digitalWrite(whatPin, LOW);
      delay(milliSecs/2);
    }
  }

/* Function to drive forward
  void MotorForward(int Pwm, int Motor) {
	if (Motor = 1) { // Left Motor
		  analogWrite(enableLPin, Pwm);
		  digitalWrite(motorL1Pin, LOW);   // set leg 1 of the H-bridge low
		  digitalWrite(motorL2Pin, HIGH);  // set leg 2 of the H-bridge high
	}
	else if (Motor = 2) { // Right Motor
		  analogWrite(enableRPin, Pwm);
		  digitalWrite(motorR1Pin, LOW);   // set leg 1 of the H-bridge low
		  digitalWrite(motorR2Pin, HIGH);  // set leg 2 of the H-bridge high
	}

// Function to drive backwards
  void MotorForward(int Pwm, int Motor) {
	if (Motor = 1) { // Left Motor
		  analogWrite(enableLPin, Pwm);
		  digitalWrite(motorL1Pin, HIGH);   // set leg 1 of the H-bridge low
		  digitalWrite(motorL2Pin, LOW);  // set leg 2 of the H-bridge high
	}
	else if (Motor = 2) { // Right Motor
		  analogWrite(enableRPin, Pwm);
		  digitalWrite(motorR1Pin, HIGH);   // set leg 1 of the H-bridge low
		  digitalWrite(motorR2Pin, LOW);  // set leg 2 of the H-bridge high
	}
*/

