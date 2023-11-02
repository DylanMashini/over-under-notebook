# Programming The Robot

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


