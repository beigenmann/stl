//Remix of Centering cone to add inside Cut taper & convert to openscad
//Remixed from: http://www.thingiverse.com/thing:508896
//8/5/2016      By: David Bunch
//
//The only variables I would change are BotInCham_OD or TopInCham_OD
ID = 17;                    //Inside Diameter
BotInCham_OD = 1;           //Original Bottom Inside Chamfer is 1mm
TopInCham_OD = 4;           //Original Top Inside Chamfer is 1mm
BIC_Rad = BotInCham_OD / 2; //Radius of Bottom Inside Chamfer
TIC_Rad = TopInCham_OD / 2; //Radius of Top Inside Chamfer
//
//Draw the basic Cone shape
module Base()
{
    union()
    {
//Bottom outside small chamfer instead of Rounding like original
        cylinder(d1=21,d2=21.82,h=.22,$fn=276);

        translate([0,0,.22])
        cylinder(d1=21.82,d2=62,h=29.78,$fn=276);   //The main taper of Cone
        translate([0,0,30])
        cylinder(d=62,h=1,$fn=276);                 //Short outer most part of cone
        translate([0,0,31])
        cylinder(d1=62,d2=55.51,h=3.24,$fn=276);    //Short taper of cone near the top

//Top outside chamfer instead of Rounding like original
        translate([0,0,34.24])
        cylinder(d1=55.51,d2=47.03,h=1.76,$fn=276);
    }
}
//This is the basic profile of Catch before cutting it
module Catch()
{
    translate([0,-3.5,0])
    rotate([-90,0,0])
    linear_extrude(height = 7, center = false, convexity = 10)polygon(points = 
    [[-7.75,-7.5],[-11,-7.5],[-11,-11],[-10.72,-29],[-7.49,-29],
    [-7.29,-28.98],[-7.1,-28.93],[-6.92,-28.85],[-6.75,-28.75],[-6.6,-28.61],
    [-6.48,-28.45],[-6.39,-28.28],[-6.32,-28.09],[-6.29,-27.89],[-6.29,-27.7],
    [-7.75,-11]]);
}
module DrawFinal()
{
    difference()
    {
        union()
        {
            difference()
            {
                Base();                         //Basice Cone Shape before cuts
                translate([0,0,-1])
                cylinder(d=ID,h=38,$fn=78);     //Drill 17mm Hole all the way thru
                translate([0,0,-.01])
                cylinder(d1=ID + BotInCham_OD,d2=ID,h=BIC_Rad + .01,$fn=78);    //Chamfer the bottom of inside hole
                translate([0,0,36-TIC_Rad])
                cylinder(d1=ID,d2=ID + TopInCham_OD,h=TIC_Rad + .01,$fn=78);    //Chamfer the top of the inside hole
                mirror([1,0,0])
                translate([0,-5.8,11])
                cube([16,11.6,19]);             //Cut cube opening for catch

                translate([0,0,11+19])
                rotate([0,0,180])
                scale([1,1,6.6973/11.6])        //Scale to make it a 30 deg. cut
                rotate([0,90,0])
                cylinder(d=11.6,h=16,$fn=8);    //Cut for less overhang problems
            }
            Catch();                            //Add catch after all the cuts
        }
        translate([0,0,11])
        cylinder(d1=17,d2=14.2,h=18,$fn=64);    //Taper cut the Catch
        translate([0,0,-1])
        cylinder(d=17,h=12,$fn=64);             //Cut the rest of the catch to match inside hole
    }
}
DrawFinal();