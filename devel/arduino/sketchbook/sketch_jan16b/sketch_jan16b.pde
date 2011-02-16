// Use this code to test your motor with the Arduino board:

// if you need PWM, just use the PWM outputs on the Arduino
// and instead of digitalWrite, you should use the analogWrite command

// 
int motor_right[] = {7, 8};
int motor_left[] = {5, 4};
int enableLPin = 3;
int enableRPin = 6;

// Setup
void setup() {
Serial.begin(9600);


// Setup motors
int i;
for(i = 0; i < 2; i++){
  pinMode(motor_left[i], OUTPUT);
  pinMode(motor_right[i], OUTPUT);


}
analogWrite(enableLPin, 255); 
analogWrite(enableRPin, 255); 

}

//Loop
void loop() {

drive_forward();
delay(1000);
motor_stop();

turn_right();
delay(1000);
motor_stop();

analogWrite(enableLPin, 155);
analogWrite(enableRPin, 155);

motor_stop();
delay(1000);
motor_stop();

turn_left();
delay(1000);
motor_stop();

drive_backward();
delay(1000);
motor_stop();

analogWrite(enableLPin, 255); 
analogWrite(enableRPin, 255); 


}

// Drive

void motor_stop(){
digitalWrite(motor_left[0], LOW);
digitalWrite(motor_left[1], LOW);

digitalWrite(motor_right[0], LOW);
digitalWrite(motor_right[1], LOW);
delay(25);
}

void drive_forward(){
digitalWrite(motor_left[0], HIGH);
digitalWrite(motor_left[1], LOW);

digitalWrite(motor_right[0], HIGH);
digitalWrite(motor_right[1], LOW);
}

void drive_backward(){
digitalWrite(motor_left[0], LOW);
digitalWrite(motor_left[1], HIGH);

digitalWrite(motor_right[0], LOW);
digitalWrite(motor_right[1], HIGH);
}

void turn_left(){
digitalWrite(motor_left[0], LOW);
digitalWrite(motor_left[1], HIGH);

digitalWrite(motor_right[0], HIGH);
digitalWrite(motor_right[1], LOW);
}

void turn_right(){
digitalWrite(motor_left[0], HIGH);
digitalWrite(motor_left[1], LOW);

digitalWrite(motor_right[0], LOW);
digitalWrite(motor_right[1], HIGH);
}
