# Programming The Robot
### Dylan Mashini
### September 3rd

For programming this year, I want the robot to be capable during the driver control period using Field Oriented Control, and capable during auton. With that in mind, I have to decide how I'm going to actually program it. 

### Option 1: Rust

Rust is my favorite programming language, and I've wanted to use it for robotics for a while. If you haven't heard of rust before, the premise is that it has speed of C++, and the memory safety of high level languages like Javascript. Instead of using an expensive Garbage Collector, it uses what's called a "borrow checker." Rust's borrow checker ensures that references to data obey two rules: at any given time, either one mutable reference or any number of immutable references can access data, but not both, and references must always be valid. Ownership in Rust dictates that each value has a single owner, and when that owner goes out of scope, the value is dropped; borrowing allows access to a value without taking ownership through a reference, subject to the rules of the borrow checker. This mechanism prevents data races and null pointer dereferencing, guaranteeing memory safety without the need for a garbage collector. 

#### Rust Pros
- Memory Safety
- Fun to Program in
- I have lots of experience

#### Rust Cons
- Less mature Vex ecosystem
	- Rust modules are called ``crates``. Thankfully, Queens Vex-U team has released a Vex Rust Runtime. This makes it possible to use Rust, but there are a few issues with it. First, it has a safe API. This means that all references have to be valid, including motors and sensors. So if a motor is unplugged or fails mid match, the whole program panics, which isn't a good behavior for competition robotics. If our catapult motor fails, we don't want our drivetrain to stop working. 
- No OkAPI
	- In C++, there is a library called OkAPI available that allows you to use their odometry, and drive code inside of your program. This is very useful so you don't have to write all of those algorithms by yourself. I'm confident that we could write those algorithms, but they'd be more error prone and less efficient then the battle tested OkAPI ones. 


Unfortunately, I don't think it makes sense to use Rust for this, but as the Vex Rust ecosystem improves, I hope to use it in the future. 

### Option 2: C++

Now that we know that C++ is the desired language, we have to pick a runtime. There are two main options:

### Official Vex Runtime
The Official Vex Runtime, released by Vex is the default choice. To use it, you have to use one of Vex's official IDEs, and there isn't much transparency about the build process. 

#### Pros:
- Official Vex Support
- Installed on School Computers
	- Cobb County has an insane amount of restrictions built into their computers. VexCode is one of the allowed applications, so it would let me use school computers for programming. This isn't a huge issue because I usually bring my personal laptop to school, and I do most of the programming at home anyways. 

#### Cons:
- Proprietary IDE
	- As an avid NeoVim user, I don't like the idea of using a different IDE. Especially considering that there isn't any support for Vim keybindings, this alone is a dealbreaker for me. 
- No OkAPI support
	- OkAPI only supports the Pros runtime. 
- Competition Legal


### ProsV5

#### Pros (No Pun Intended):
- OkAPI support
	- This allows us to rely on smarter people then us to write the complex algorithms. This will be more reliable, and efficient then anything I could make. 
- Use any IDE
	- Although there is a VSCode plugin that is recommended, there is also a CLI that you can use in any environment that you want. This means that my current setup of NeoVim and tmux will work well with Pros. 
- More idiomatic C++ practices
	- Uses FreeRTOS, which is a standard Real Time Operating System used in embedded programming outside of vex. Also recommends using C++ std mutexes and atomics, which I want to learn, and wouldn't with the Official Runtime 
- Competition Legal
	- Although Pros isn't an official vex product, they still have a competition template that is allowed for all Vex competitions. 

#### Cons:
- No official vex support


## Decision Matrix

| Criteria/Options                 | Weight | Rust | Official Vex C++ | ProsV5 C++ |
|----------------------------------|--------|------|------------------|------------|
| Memory Safety                    | 4      | 10   | 8                | 8          |
| Ease of Programming              | 3      | 8    | 6                | 8          |
| Programming Experience           | 5      | 10   | 10               | 10         |
| Ecosystem Maturity               | 4      | 4    | 10               | 8          |
| External Library Support (OkAPI) | 5      | 2    | 2                | 10         |
| IDE Compatibility                | 4      | 10   | 2                | 10         |
| Competition Legality             | 5      | 8    | 10               | 10         |
| Official Support                 | 3      | 2    | 10               | 4          |
| Hardware Robustness              | 4      | 4    | 6                | 6          |
| **Total Score (out of 360)**     |        | 192  | 216              | 266        |

Now that we know we are using ProsV5, we can start programing. This isn't going to be a lot of work, because we are able to use OkAPI's X Drive support, so it's just a few method calls to setup. Here is the code for driving. 

```cpp
chasis.fieldOrientedXArcade(
	main_controller.get_analog(pros::E_CONTROLLER_ANALOG_LEFT_Y),
	main_controller.get_analog(pros::E_CONTROLLER_ANALOG_LEFT_X),
	main_controller.get_analog(pros::E_CONTROLLER_ANALOG_RIGHT_X),
	imu.get_heading() * 1_deg
);
```

## Programming the Catapult

To Program the catapult, we had to consider what it needed to do. The primary functionality of the catapult is for match loads. Basically, we represented the catapult as a finite state machine (FSM). If you haven't heard of state machines, the idea is that you can represent a system as being in a finite number of states, and the FSM transitions between these states. 

Here are all the different possible states we determined are needed:
- Idle
	- The catapult is idle when it isn't enabled by the controller. The Idle state sets the motor to 0 voltage, and leaves the catapult up. 
- Winding
	- The winding state is the first state after the catapult turns on. It winds the catapult back to its fully down position. 
- Locked
	- The locked state is when the match load team member puts the Tri-Ball in. This involves maintaining the lowered position for about one second. 
- Firing
	- The firing state is when the slip gear goes past it's teeth to release the catapult. This has to be quick and explosive, so we use max speed. This releases the catapult and sends the Tri-Ball flying. 

Here's a diagram of how we transition between states

![](images/stateMachine.jpeg){ width=100% }

Here's what each state actually does inside of the code, and when it transitions. I'll try to prevent it from getting too technical, but I will be including lots of code in here to show how it actually works behind the scenes. 

#### Idle State

The idle state doesn't do anything if the catapult isn't turned on by the controller. If the catapult is turned on, this is what the IDLE state does. 
```cpp
if (catapultState == IDLE) {
	pros::lcd::set_text(3, "IDLE"); // Diognostic Data for debugging
	catapultState = WINDING; // Moves to the WINDING state
	stuckCount = 0; // Resets stuckCount
}
```

In the catapult code, stuckCount is used to figure out if there is an error happening. For example, if something is preventing the catapult from winding, and it keeps winding for a long time, stuckCount increases until it hits a threshold. At that point, it resets the catapult by turning the motor off for a few seconds, then tries again. We reset stuckCount so it doesn't increment and hit it's limit throughout multiple cycles. 

#### Winding State
The way that motors work in Vex, is that they maintain an absolute position throughout the program running. This is measured in encoder ticks. There are 1800 encoder ticks in one rotation. This absolute position starts at 0 when you initialize the motor, and increases as the motor rotates. When you want to move the motor to a specific position, you give it an absolute position. This means that if you want to reset the motor back to where it started rotating less than one full rotation in the positive direction, you'd need to set it to go to the next multiple of 1800. In this code, we have a variable called ``absoluteNextZero`` that represents the next absolute position where the robot is at its initial position. For this code, assume that the robot's initial position was all the way down where we want the catapult to lock. 

Here is the code used for the ``WINDING`` state of the catapult. 

```cpp
if (catapultState == WINDING) {
		// Increments stuckCount to make sure it isn't stuck on winding for too long
        stuckCount++;
        // Threshold is 400. This is equal to 4 seconds,
        // because this code is a while loop with a 10ms delay. 
        if (stuckCount > 400) {
	      // If it has been attempting to wind for 4 seconds, 
	      // set it to idle and wait 2.5 seconds. 
          catapultState = IDLE;
          catapult->move_voltage(0);
          pros::delay(2500);
        }
        // After winding, set absoluteNextZero to the 
        if ((int)catapult->get_position() % 1800 != 0) {
	      // Update absoluteNextZero for next iteration
          absoluteNextZero = (int)catapult->get_position()  +
                             (1800.0 - (int)catapult->get_position() % 1800);
        } else {
          absoluteNextZero = (int)catapult->get_position();
        }
        // Debug Info
        pros::lcd::set_text(3, "WINDING");
        // Move the catapult to the next zero (down position) 
        // subtract 5 because for some reason the move_absolute
        // function tends to overshoot, firing the catapult 
	    // too early.
        catapult->move_absolute(absoluteNextZero - 5, 200);
        // If we are within 15 ticks of our goal,
	    // transition to the LOCKED state. 
        if (catapult->get_position() > absoluteNextZero - 15) {
          catapultState = LOCKED;
        }
      }
```

This is the most complex stage of the catapult, and notice the amount of seemingly arbitrary constants. These came out of hours of testing to figure out how we can get a consistent launch cycle. A way to make this work better is going to be using a housemade PID. The ``move_absolute`` method uses the built in PID built into the vex firmware. This has some issues, especially in our scenario, where the amount of work done by the motor differs massively depending where the slip gear is. I also think it would be a good exercise to build our own PID. 

#### Locked
The locked state of the catapult is where the match load enters the catapult. 

```cpp
if (catapultState == LOCKED) {
	pros::lcd::set_text(3, "LOCKED"); // Debug Info
	stuckCount = 0; // Reset stuckCount
	pros::delay(1000); // Wait one second
	catapultState = FIRING; // Fire the catapult
}
```

The locked code is quite simple. All it has to do is stay where it is for one second. We don't interact with the motor because the move_absolute function from the previous state still applies, and we just wait for one second before transitioning into FIRING. 

#### Firing
The firing state just has to move the motor past the slip gear's teeth. 

```cpp
if (catapultState == FIRING) {
		// We're using stuckCount just in case anything goes wrong
        stuckCount++; 
        pros::lcd::set_text(3, "FIRING"); // Debug Info
        // Move to the zero position + 200 ticks
        catapult->move_absolute(absoluteNextZero + 200, 200);
        // If we're within 10 ticks of our goal, switch to winding
        if (catapult->get_position() > absoluteNextZero + 190) {
          catapultState = WINDING;
        }
        // If we've been stuck for over 400 iterations,
        // reset the catapult
        if (stuckCount >= 400) {
          catapultState = IDLE;
          catapult->move_voltage(0);
          pros::delay(2500);
        }
      }
```

That's basically all of the catapult code. It's quite simple when you abstract it with the idea of a Finite State Machine. Before I started using the FSM pattern, I had really complex convoluted code that barely worked based on weird conditions of the motor. Using a FSM simplifies this significantly. This code has one drawback, which is the requirement to start in the same place every run. I have this set to be right before the first tooth of the slip gear. 