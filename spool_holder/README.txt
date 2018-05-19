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


http://www.thingiverse.com/thing:1715713
Parametric openscad Remix of Universal stand-alone filament spool holder by GeoDave is licensed under the Creative Commons - Attribution license.
http://creativecommons.org/licenses/by/3.0/

# Summary

This is a remix of the parts needed for a Kossel 2020 printer.  This was remixed from: http://www.thingiverse.com/thing:508896

For the remix of the guide tube see this part: http://www.thingiverse.com/thing:1710043 . I did include the stl file for this that I used on my Kossel.

I changed the profile slightly of the Spindle cavity & the Spool Holder Base Shaft & recommend printing Spool_New_Spindle_And_Shaft_Test.stl to make sure it will fit for you.  For the original profile of the cavity & shaft, test print Spool_Original_Spindle_And_Shaft_Test.stl
In the openscad files for the Spool Spindle & Spool Holder base 2020 there is an option to choose between these 2.  The reason I made that change was for a better fit printing from my printer.  If you are using one of these with another part from that project, you will want to use the original profile, but be sure & run the test print of the original profile1st to make sure it will work for you.  The test prints will take a lot less plastic than the final parts.

Changes to the Spool Holder Base 2020 are:
1. variable diameter hole for the T-Nut Screw with the option for a slotted hole. 4.8mm is default for M4 Screws
2. Width of Aluminum extrusion used. 20.5mm is default
3. Thickness of plastic that T-Nut screw head rests against.
4. Bottom Base width. (Default is 4mm).  If your printer has a hard time printing that narrow of width, you can increase it

Changes to Spool Spindle
1. Made Height of Spindle Center variable. Default matches height of Original 4" Spool Spindle
2. Made Bearing Wheel Cavities Rounded at the top for better printing
3. Added Optional Slot opening where Spool Holder Attaches (This printed better for me this way)
4. Changed the Center cut of the Spindle for an easier fit for me
   Variable: OriginalCenter = 0 (Original Center Cut)
   Variable: OriginalCenter = 1 (New Center Cut)

Change to Centering Cone
1. I really only changed was rounding the upper internal cut for no overhang when printing

Bearing Wheel I did not really change other than converting it to openscad

I included the STL files I used for my Folger Tech Kossel 2020 3d printer.  There is one image that visually shows the difference between the original & new profile of Spindle cavity & Spool Holder Shaft.

If you need any other of the original parts converted to openscad, let me know & I will take a look to see if it is possible for me to convert it.

There is also a test print to check the width of your aluminum extrusion.  That file is: 2020_CutWidth_20_5_Test.stl or edit the openscad file 2020_CutWidth_20_5_Test.scad to what you want to use.

The filament spools I use are about 8" in Diameter & 3" or less thick.  If yours are wider or thicker than this you may have to make your SpoolSpindle taller and/or your Guide Tube longer.

After you are happy with your test prints, here are the parts to print for the Kossel 2020

Print these parts for the Kossel 2020:
1x SpoolHolderBase_2020_20_5_Rev18.stl
1x SpoolSpindle_Mod_Rev15.stl
1x GuideTubeMod_1_75F_116Len_N30Zang_70mmHt_Rev15.stl
1x CenteringConeMod_Rev8.stl
1x BearingWheel_6x_Rev1.stl