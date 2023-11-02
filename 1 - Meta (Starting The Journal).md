# Meta (Starting The Journal)
### Dylan Mashini

Right now, it is T-4 hours until the Vex Worlds Final round. This means that we have 4 hours until the game releases. I'm taking today to set up some infrastructure for the upcoming season, and my hopes are high for a good game. This upcoming season, we are aiming high. Our goal is to qualify for Vex Worlds. This is a huge goal considering that we didn't even qualify for states in 2023. All we know about the game is the name, which is "Over Under". 

## The Notebook

Last year we didn't really bother with a Robotics Notebook. All we wanted to do was place, but we didn't think about the process towards that. This post is about some meta-cognition that I've been doing on how we can perform better this year. 

### What Went Wrong

The lack of a robotics notebook is a great example of what went wrong last year. We didn't slow down to think about our decisions and how they would affect us in the future. Because of that, we were up till 4AM the night before competitions trying to work past our lack of planning and organization. This led us to being a grumpy team during competitions and our drivers consuming more caffeine the points scored. This was not a sustainable model, and the fact that we made it through competitions with a working robot was an accomplishment. I'm hoping that documenting all of our solutions will force us to think about the decisions we make before we spend hours building. I've also spent time learning CAD so we can design and engineer our robot instead of haphazardly throwing some metal together. If everything is designed in advance, the builders can really hone into the small details and intricacies. It will also make it a better experience for everyone. We should keep this quote in mind when building and creating our robot. 

> "The man who loves walking will walk further than the man who loves the destination. "
> - Sam Sulek

Last year we were more concerned with how we place then learning engineering and getting better. We viewed our robot as a means to an end, and this made it impossible to perform well. This year we want to really learn how to design a robot that is capable, and not copy robot reveals. 

This probably seems far more philosophical then necessary, but if we want to improve over last year, we have to have some sort of paradigm shift from whatever we were doing last year. 

### Technology

Deciding on how to do the notebook was the first problem of the year we had to conquer. I plan on compiling all the journal entries and everyone's writing into a PDF journal to be printed out and bound at a print store. There are hundreds of different tools out there to use, but I want to pick something that I won't regret in the future. As someone who would label themself as more of a programmer then an engineer, I immediately thought of plaintext representations that I could store in Git. If you aren't familier with Git, it is a Version Control software used for collaboration in programming. It is ideal for this for a few reasons.

- Using plain text makes the data portable. I can easily migrate to any other solution and don't have to worry about subscriptions/data loss. If I use google slides, my data is stored on their cloud. I don't have any control over it, and frankly that isn't something that I would like to do. 
- Using the open source tool Pandoc, I can easily generate a PDF document from our journal, and it is heavily customizable. 
- Timestamps are built in. Git will always record when a change happened, and who did it. 
- Markdown/Pandoc supports LaTeX math expressions. This is what I use for math currently, and it makes it easy to put mathematical equations. For example, the quadratic formula:

$$
x=\frac{-b \pm \sqrt{b^2-4ac}}{2a}
$$

- That's far better then anything I could do in google slides, which will allow for better notation of our problem solving process. 

Another benefit is that I can write code to create a table of contents using the data of when a post was made, who made it, its page number, and the title. Doing this programmatically prevents any mismatch between the table of contents and the actual journal. 