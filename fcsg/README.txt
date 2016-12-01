                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:1159436
The Snowflake Machine by mathgrrl is licensed under the Attribution - Non-Commercial - Share Alike license.
http://creativecommons.org/licenses/by-nc-sa/3.0/

# Summary

The Snowflake Machine uses random numbers, mathematical algorithms, computer code, and SCIENCE to create well over a billion unique and beautiful snowflakes. 

But all you have to do is click a button!  Press "Open in Customizer" to get started.  

If you 3D print a snowflake from this model, please take a photo of your print and then click the "I Made One" button to upload your picture, so we can all see it!

UPDATE:  [UrbanAtWork](https://www.thingiverse.com/UrbanAtWork/about) made a great video of the Snowflake Machine in action in OpenSCAD: https://www.youtube.com/watch?v=coWbcSe4t7M&feature=youtu.be

# What can I make with the Snowflake Machine?

You can make snowflakes!  Specifically, you can:
* Quickly generate 3D-printable snowflakes using a random number seed
* Use sliders to control the style and look of your snowflake in ten different ways
* Create snowflake ornaments by selecting a hanging loop feature
* Create giant snowflakes with lots of detailed design steps
* Create micro-flakes, if you have an ultra-fine nozzle! (More on that soon...)

The demo snowflakes in the gallery are shown both alone and alongside books for size comparison.  Each demo snowflake is available for download as an STL in the Downloads section, but it's more fun to make your own!


# How to Operate the Snowflake Machine

Here's what to do:
* Press "Open in Customizer"
* Choose seed and style settings
* Click "Create Thing"
* Wait 2-3 minutes for the magic of creation to take place
* Go to your list of Things and reload it until your new snowflake appears
* Download, 3D print, enjoy, take a picture, post a Make
* At this point there will still be over a billion more snowflakes to make, so keep going

# How does the Snowflake Machine work?

The Snowflake Machine generates snowflakes with an algorithm that approximates the way that some kinds of snowflakes grow in real life.  

Stellar plane crystal snowflakes start from a hexagonal prism seed and then grow outward with branches and plates whose size and positions are determined by the temperature and humidity of the atmosphere.  

To mimic this process, the OpenSCAD code behind the Snowflake Machine generates sequences of random numbers based on a random seed that you select, and then grows a snowflake design by adding branches or plates in each step. The random number sequences and the style parameters whose values you select with the Customizer sliders act like the temperature and humidity of the air around the snowflake, making it more or less likely that different formations will be generated.


# Tips and Tricks for Snowflake Design

Here is some advice for getting the most out of the Snowflake Machine:
* Once you set a seed, you can change style sliders to alter the look and feel of the snowflake. Or you can change the seed again to generate more random snowflakes whose formation patterns are governed by your style slider settings.
* If you like a particular seed, then write it down so you can come back to it later! Once you change the seed value your old seed will be lost forever, like a melted snowflake.
* Mathematically perfect snowflakes (with "organic" set to zero) generate more quickly and also print faster.  But snowflakes with a random/natural look (with larger "organic" parameter values) look more realistic and stylized.
* Snowflakes with six steps and medium style settings will be approximately the size of the orange preview circle.  You can go up to 11 steps, but the snowflakes usually look best when they have between 4 and 7 steps. 
* The best way to change the target size of your snowflake is to set the "target_diameter" parameter to your desired size. This will change the size of the orange target circle, and adjust lengths and widths accordingly in the algorithm. 

It's worth keeping in mind that sometimes things look good on the screen but don't come out exactly how you expect when they are actually printed. If you keep track of your seed values, then you can iterate your design and make it better.  Below is a photo that illustrates such an iteration, with the initial design on the left and the updated design on the right. Based on the outcome of the initial design, I turned down the "organic" and "fat" parameters and increased the "fuzzy" and "sharp" values to get a cleaner and more detailed design.

![Alt text](https://thingiverse-production-new.s3.amazonaws.com/assets/0a/e1/1e/20/38/snowflake_design_iteration.jpg)

It's a little bit difficult to see snowflake details in the small Customizer window within Thingiverse. If you'd rather work with a larger, faster preview then you can download a free copy of [OpenSCAD](http://www.openscad.org), get the snowflakerator.scad file from the Downloads section of this Thing, and then generate random snowflakes directly in OpenSCAD.  To do this, you modify the parameters in the editor on the left-hand side, and then press "F5" to see the result.  It looks like this:

![Alt text](https://thingiverse-production-new.s3.amazonaws.com/assets/a3/a7/80/28/c3/snowflakerator_screenshot.jpg)

# About the Demo Files

If you want snowflake designs that have already been test-printed, try the demo models in the Download section:
* The  "micro_flake" models are about 15mm in diameter and 1mm thick. These are designed for printing with a smaller-diameter nozzle such as the .25mm nozzle that comes with the Ultimaker Olsson block.
* The "tiny_flake" models are about 25mm in diameter, 2mm thick, and have loops for hanging as ornaments.
* The "small_flake" models are about 50mm in diameter, 2mm thick, and have loops for hanging as ornaments. 
* The "medium_flake" models are about 100mm in diameter and 1mm thick.
* The "large_flake" models are about 220mm in diameter, 1mm thick, and really huge! You'll need a large build platform to print these flakes, which were designed to max out the large build area on an Ultimaker 2.