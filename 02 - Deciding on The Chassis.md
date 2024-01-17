# Deciding on The Chassis
### Dylan Mashini
### May 3rd, 2023

This entry is in summary of a strategy meeting held to decide on the form factor for our robot this year. 

## Form Factor

The type of chassis for this year was a major decision for our team. We've wanted to do an X drive for more than a year now, but we didn't know if it was ideal for this year's game. The other drivetrain we were considering was a Tank Drive, which is what we used last year. 

### X Drive

##### Pros:
- An X drive likely will allow us to be more nimble, and have a better offense
- Field Centered Control would be ideal with a robot that has an intake on the front and a launching mechanism on the back
- The ability to strafe is ideal in a game where the field is split into 2
- X drives look cool
- The pusher can be on the side and we can drive normally because of the holonomic drive capabilities

##### Cons:
- We can be pushed around more easily and will be prone to defense
- Mounting an intake, launcher, and an endgame mechanism will be difficult with an X drive
- Likely direct drive meaning we have less control over the gear ratio and won't be able to distribute load across motors
- Due to the likely non-symmetrical nature of our ideas for endgame, driving straight may be an issue because of [center of gravity issues](https://www.vexforum.com/t/what-are-the-pros-and-cons-of-x-drive-for-in-the-zone/41353/5)
- Complexity of Code
- Harder to get over the bar


![Source: @Codec on vexforum.com](images/simpleXDrive.jpeg)

	Source: @Codec on vexforum.com

### Tank Drive

##### Pros:
- Robust and Simple which makes troubleshooting and design easier
- Increased Traction will allow us to be defensive
- Design Flexibility allows us to mount sub-assemblies easier
- Simplicity of Code
- Already have experience deciding 
- Easier to get over the bar

##### Cons:
- Limited Maneuverability makes efficient operation on the field more difficult
- Larger Footprint
- Limited Aesthetic Appeal (Doesn't look Cool)

### Making Sense of Our Options

At the end of the meeting today, we ultimately decided on an X drive. Let's break down why

Everything boils down to a few tradeoffs:

- Nimble vs Strong
- Simple and Less Capable vs Complex and More Capable
- Aesthetic Appeal

#### Nimble vs Strong:
Last year, we had the same discussion, but we ultimately decided to use a Tank Drive. So what has Changed? We envision matches this year being far less defensive for a few reasons:

- The nature of the game means that each robot has a distinct task (Over vs Under), can will likely only partake in defense after their task is done. We imagine that this eliminates defense for the first half of the round. Compare this to Spin Up, where if a bot couldn't shoot it could just attempt to defend against their opponent and defend. 
- Bots have to be light if they want to attempt to get points during Endgame. This means that you won't see heavy bots that can push you around. This makes the risk of being easily pushed around less likely. 
- Last year, getting the rollers required defense at the end of the match, so bots were built with that in mind. There isn't any similar motivator for bots to be purpose-built for defense this year. 

It is also more beneficial to be Nimble this year compared to last year because a smaller operating space creates additional benefits from being maneuverable. 

#### Simple and Less Capable vs. Complex and More Capable:
Last year was our first year creating Competition Robots, so we had very little build experience. This year we feel confident that we can engineer a more complex drivetrain so we are willing to take on the challenge of an X Drive. The only concern about complexity that we had was reliability. We know that during a competition everything that can go wrong with our robot likely will, so we tried to identify possible troubles that we could have with our robot during a match. 

- Field Centric Control Failure
	- A major benefit of X Drive is the ability to have Field Centric Control, but this requires you to track the angle of the robot throughout the match relative to its starting position. We plan to do this through Odometry/Inerta Sensors. This adds more complexity and room for error in the code. If error builds up over time, it could negatively impact the drive team's ability to carry out tasks efficiently. Fortunately, we can mitigate this by getting measurements from two sources. Measuring from both Odometry and an Inertia sensor allows us to use a Kalman Filter and get a more reliable value. This makes the risk minimal, and not as large of a concern. 
- Mounting Failure
	- When X Drives are considered, one of the major issues is the mounting of subsystems. The strange chassis shape inevitably reduces the possible mounting points for subsystems.  We discussed this issue and decided that we could mitigate this by remaining diligent about what is load bearing and using good practices in building. As long as we aren't lazy with the strategies we use to mount subsystems, failure seems unlikely. 
- Motor Failure
	- In a tank drive, motors are usually linked by a powertrain (Gears or Chains), where if one motor fails, the robot is still fully maneuverable. This type of failure would cripple an X drive because all the motors are direct drive. Fortunately, we've never had a motor fail during a match, and looking on the VexForum, it seems like most instances of this are either from mistreating the motors (overheating, running without cartridge, etc), or manufacturing defects with recalls. Our motors are more than a year old, so any defects would've already been found so we are confident that this won't be an issue. Worst case scenario we lose a round and replace the motor. 

Overall, failure due to choosing an X drive seems unlikely. X Drives increases the risk of poor practices in programming and building, but as long as we remain diligent about making conscious decisions and redundant systems, we should be in the clear. 

#### Aesthetic Appeal:
This one doesn't really matter, but this is honestly what initially got our team interested in using X Drive. I look forward to seeing our robot be able to strafe, and X drives definitely have the "cool factor" that initially got me interested in robotics. 

\newpage
## Decision Matrix
**Scores are 1-10**

| Criteria            | Weight    | X Drive | Tank Drive |
|---------------------|------------|---------------|------------------|
| Maneuverability     | 5          | 10            | 6                |
| Mounting Complexity | 2          | 6             | 8                |
| Drive Reliability   | 3          | 7             | 9                |
| Defense Capability  | 1          | 5             | 9                |
| Aesthetic Appeal    | 1          | 10            | 6                |
| Coding Complexity   | 2          | 6             | 8                |
| **Weighted Total**  |            | **110**       | **104**          |


### Reckoning with the decision 

Building an X Drive is certainly going to be a new engineering challenge that we have to face. Right now, I'm assuming that going over the center bar is out of the question with an X drive, so we'll have to design our bot by going through the side slots. This already limits us to 12 inches vertically. We also have to remain lightweight because we want to have an Endgame. Endgame is going to be a huge benefit early in the season, because of the relative nature of it. Just getting up is going to give you a massive amount of points at local competitions because many teams won't even attempt an endgame. 