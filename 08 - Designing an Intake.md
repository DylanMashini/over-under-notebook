# Designing an Intake
### Dylan Mashini
### July 1st, 2023

This is a writeup after a Team Strategy Meeting, detailing the decisions we made, and why we made them. 

## The End Of CAD

Although we have had a lot of success designing with CAD, a more iterative real-world approach is going to serve us better for designing the intake. This is for a few reasons, but the most significant is mounting the intake at an angle. This is going to require bending Structural Pieces, which is difficult to model in Fusion. CAD really excels at critical and complex systems like the Drivetrain that everything else is going to be built on top of. It is less beneficial for smaller subsystems that can be tuned and iterated on more easily in the real world. I am disappointed about losing the ability to make renders of every part that we talk about, but it is a tradeoff that is worth it. 

## Design Requirements

- Intake Tri-Balls into Catapult
- Run in reverse to place Tri-Balls into low goal
- Fit into size requirements
- Use minimal Polycarbonate because of material constraints
- Maximum of 11W of motor usage (No more than 1 big motor or 2 Small motors)

### Motors
This is a good time to discuss the new motor rules. I was surprised to see that the 5.5W work-cell motors were added to the list of competition legal parts. These are going to offer the ability to make mechanisms simpler because instead of having to devise your own powertrain, you can just have 2 separate sources of power.  Right now, we only have the 11W motors, but we have a surplus of them, and once the school year begins we can order 5.5W motors. So we are going to prototype with above the legal wattage and replace motors once we can get 5.5W motors. To make sure that 5.5W motors are strong enough, we will only run the 11W motors at a max of 50%. 

## Designing It

Right now, we have to decide between a horizontal and a vertical intake. What I'm defining as a horizontal intake is an intake with wheels that are parallel(ish) to the ground. A vertical intake has wheels at a $90^\circ$ angle to the ground. This type of intake (from Spin Up) would be considered a vertical intake based on my terminology. 
![](images/spinUpIntake.png)

There are a few categories we used to judge our intake:

- Consistently Intake
	- The intake must be able to consistently intake Tri-Balls. This is important because of the strange shape of the 
- Footprint
	- The intake needs to fit into the existing build and allow for the addition of an endgame
- Easy to Build
	- The intake needs to be easy enough for us to build. We're already almost halfway through summer, and we want to finish everything except for endgame before school starts
- Place in Low Goals
	- We envision an intake with a secondary function of placing Tri-Balls into the low goals. 
- Intake into existing catapult design
	- The Tri-Balls should consistently land in the existing hardware for our catapult. 
	
We considered horizontal vs vertical intake across these criteria and determined:

### Consistently Intake
Both can consistently intake, although I would say that a horizontal intake will likely be much easier to build where it can consistently intake. This is because, with a vertical intake, we likely would need a bottom and top set of wheels. This means that it will have to be elevated off the ground, and I don't see how that could work well for us. 

### Footprint
The footprint is going to be similar either way. I don't see any significant difference between horizontal or vertical intake. 

### Easy to Build 
There isn't a significant difference in the difficulty of building the two. Both use flex wheels and have 2 axles that must rotate simultaneously. 

### Place in Low Goals
I don't think that a vertical intake would have the capability to run in reverse and place Tri-Balls into the low goals. Horizontal intakes will be much more likely to be capable of doing this. 

### Intake into existing catapult design
Both could with proper engineering and design, but it would be much easier to design a horizontal intake to do this, because of the height of the catapult. 

## Decision matrix
**Scores are from 1-10**

| Criteria                             | Weight | Horizontal Intake Score | Vertical Intake Score |
|--------------------------------------|--------|-------------------------|-----------------------|
| Consistently Intake Tri-Balls        | 5      | 8                       | 6                     |
| Fit into size requirements (Footprint)| 3     | 7                       | 7                     |
| Easy to Build                        | 4      | 7                       | 7                     |
| Place Tri-Balls into low goal        | 4      | 9                       | 3                     |
| Integrate with existing catapult     | 5      | 9                       | 6                     |
| **Weighted Total**                   |        | **170**                 | **121**               |

So it looks like we're making a horizontal intake. Now that we know that, we know generally what we want. There should be two sets of wheels, tensioned together with banding. These will pull the Tri-Ball onto a piece of polycarbonate. When designing it, we considered making it able to also act as a climber for our endgame. This proved too difficult to design, but it might appear in a future iteration. With this design in mind, we are going to begin building the intake. 