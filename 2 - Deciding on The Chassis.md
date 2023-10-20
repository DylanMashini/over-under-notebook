# 2 - Deciding on The Chassis
### Dylan Mashini

This entry is in summary of a strategy meeting held to decide on the form factor for our robot this year. 

## Form Factor

The type of chassis for this year was a major decision for our team. We've wanted to do a X drive for more than a year now, but we didn't know if it was ideal for this year's game. If we didn't chose a X drive, we would've used a traditional tank drive (like we did last year).

### X Drive

##### Pros:
- A X drive likely will allow us to be more nimble, and have a better offense
- Field Centered Control would be ideal with a robot that has a intake on the front and a launching mechanism on the back
- Ability to strafe is ideal in a game where the field is split into 2
- X drives look cool

##### Cons:
- We can be pushed around more easily and will be prone to defense
- Mounting an intake, launcher, and a endgame mechanism will be difficult with an X drive
- Likely direct drive meaning we have less control over the gear ratio and won't be able to distribute load across motors
- Due to the likely non symmetrical nature of our ideas for endgame, driving straight may be an issue because of [center of gravity issues](https://www.vexforum.com/t/what-are-the-pros-and-cons-of-x-drive-for-in-the-zone/41353/5)
- Complexity of Code
- Harder to get over the bar


![Source: @Codec on vexforum.com](images/simpleXDrive.jpeg)

	Source: @Codec on vexforum.com

### Tank Drive

##### Pros:
- Robust and Simple which makes troubleshooting and design easier
- Increased Traction will allow us to be defensive
- Design Flexibility allows us to mount sub assemblies easier
- Simplicity of Code
- Already have experience deciding 
- Easier to get over the bar

##### Cons:
- Limited Maneuverability makes efficient operation on the field more difficult
- Larger Footprint
- Limited Aesthetic Appeal (Doesn't look Cool)

**INSERT IMAGE OF LAST YEAR'S DRIVETRAIN**


### Making Sense of Our Options

At the end of the meeting today, we ultimately decided on a X drive. Let's break down why

Everything boils down to a few tradeoffs:

- Nimble vs Strong
- Simple and Less Capable vs Complex and More Capable
- Aesthetic Appeal

#### Nimble vs Strong:
Last year, we had the same discussion, but we ultimately decided to use a Tank Drive. So what has Changed? We envision matches this year being far less defensive for a few reasons:

- The nature of the game means that each robot has a distinct task (Over vs Under), can will likely only partake in defense after their task is done. We imagine that this eliminates defense for the first half of the round. Compare this to Spin Up, where if a bot didn't have the capability to shoot they could just attempt to defend against their opponent and defend. 
- Bots have to be light if they want to attempt to get points during Endgame. This means that you won't see heavy bots that are able to push you around. This makes the risk of being easily pushed around less likely. 
- Last year, getting the rollers required defense at the end of the match, so bots were built with that in mind. There isn't any similar motivator for bots to be purpose built for defense this year. 

It is also more beneficial to be Nimble this year compared to last year because a smaller operating space creates additional benefit from being maneuverable. 

#### Simple and Less Capable vs. Complex and More Capable:
Last year was our first year creating Competition Robots, so we had very little build experience. This year we feel confident that we can engineer a more complex drivetrain so we are willing to take on the challenge of an X Drive. The only concern about complexity that we had was reliability. We know that during a competition everything that can go wrong with our robot likely will, so we tried to identify possible troubles that we could have with our robot during a match. 

- Field Centric Control Failure
	- A major benefit of X Drive is the ability to have Field Centric Control, but this requires you to track the angle of the robot throughout the match relative to its starting position. We plan to do this through Odometry/Inerta Sensors. This adds more complexity and room for error in the code. If error builds up over time, it could negatively impact the drive team's ability to carry out tasks efficiently. Fortunately, we can mitigate this by getting measurements from two sources. Measuring from both Odometry and a Inerta sensor allows us to use a Kalman Filter and get a more reliable value. This makes the risk minimal, and not as large of a concern. 
- Mounting Failure
	- When X Drives are considered, one of the major issues is the mounting of subsystems. The strange chassis shape inevitably reduces the possible mounting points for subsystems.  We discussed this issue, and decided that we could mitigate this by remaining diligent about what is load bearing and using good practices in building. As long as we aren't lazy with the strategies we use to mount subsystems, failure seems unlikely. 
- Motor Failure
	- In a tank drive, motors are usually linked by a powertrain (Gears or Chains), to where if one motor fails, the robot is still fully maneuverable. This type of failure would cripple an X drive, because all the motors are direct drive. Fortunately, we've never had a motor fail during a match, and looking on the VexForum, it seems like most instances of this are either from mistreating the motors (overheating, running without cartridge, etc), or manufacturing defects with recalls. Our motors are more than a year old, so any defects would've already been found so we are confident that this won't be an issue. Worst case scenario we lose a round and replace the motor. 

Overall, failure due to choosing an X drive seems unlikely. X Drives increase the risk of poor practices in programming and building, but as long as we remain diligent about making conscious decisions and redundant systems, we should be in the clear. 

#### Aesthetic Appeal:
This one doesn't really matter, but this is honestly what initially got our team interested in using X Drive. I look forward to seeing our robot be able to strafe, and X drives definitely have the "cool factor" that initially got me interested in robotics. 



### Reckoning with the decision 

Building a X Drive is certainly going to be a new engineering challenge that we have to face. Right now, I'm assuming that going over the center bar is out of the question with an X drive, so we'll have to design our bot with going through the side slots. This already limits us to 12 inches vertically. We also have to remain lightweight because we want to have an Endgame. Endgame is going to be a huge benefit early in the season, because of the relative nature of it. Just getting up is going to give you a massive amount of points at local competitions because many teams won't even attempt. 