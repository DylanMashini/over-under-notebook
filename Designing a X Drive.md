Right now, we have no expirence with holonomic drives or CAD, so we decided it would be a good idea to learn both at once. The first decision that we had to make is what CAD software to use. We have access to all Autodesk products through their education license, so we have lots of choices. Based on vex library compatibility, we have the option to use Inventor or Fusion 360. My OS of choice is MacOS, and Inventor doesn't have Mac support. Because I'll probably be the main CAD designer, that makes the decision easy. 

## Learning Fusion 360
To learn fusion 360, I used a few resources:
- Vex CAD discord
- Kepler Electronics Youtube
- Trial and Error
These all proved useful, and using CAD for our drivetrain has definitely led to a better design then if we just threw something together like we previously would've done. 

## X Drive Inspiration
After looking through all the X drive designs we could find on the internet, this is the one that we want to take inspiration from. There isn't any videos of it actually working, or really any information about it online except for this picture, but it looks the cleanest and best. It doesn't have a heavy and bulky external frame, and is leaner then other designs. 
![[Pasted image 20231016195801.png]]

#### Math
We need to make sure that the holes on the inner and outer tracks are aligned so we can fit an axle through it at the ends. This actually is more difficult then it sounds, because it won't just naturally lineup. Both the size of standoffs between the tracks and the length of the different parts impact if the holes will lineup. 

To ensure that the inner and outer tracks of the chassis design align at the angled ends, we can set up a relationship based on the given parameters.  
**Defining Variables:**

Let $L_i$ be the length of the inner track's central c chanel. 
Let $L_o$ be the length of the outer track's central c chanel.
Let $\theta$  be the angle at which the tracks are angled relative to a horizontal axis
Let $d$  be the distance between the inner and outer track at the base (the length of standoff). 

**Relationships:**
The height change due to the angle for both the inner and outer tracks can be found using trigonometry.  

Inner Track:$$ \Delta h_i = L_i \times \sin(\theta) $$

Outer Track: $$ \Delta h_o = L_o \times \sin(\theta) $$
**Alignment Condition:**
For the tracks to align at the angled ends, the height difference due to the length and the height difference due to the angle must be equal:  $$ \Delta h_o - \Delta h_i = d $$  This gives:  $$ \sin(\theta) \times (L_o - L_i) = d $$  If we set theta at 45 degrees (gussets we plan to use), the above relationship becomes:  $$ \Delta h_i = L_i \times \frac{\sqrt{2}}{2} $$ $$ \Delta h_o = L_o \times \frac{\sqrt{2}}{2} $$  Substitute in the height changes:  $$ \frac{\sqrt{2}}{2} \times (L_o - L_i) = d $$  Thus, the distance $d$ is given by:  $$ d = \frac{\sqrt{2}}{2} \times (L_o - L_i) $$ This equation provides the relationship between the lengths of the inner and outer tracks' central metal pieces $L_i$ and $L_o$ and the distance $d$ for the tracks to align at a 45-degree angle.  
