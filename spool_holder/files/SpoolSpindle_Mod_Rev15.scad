//Remix of Spindle for Spool Holder
//Remixed from: http://www.thingiverse.com/thing:508896
//8/4/2016      By: David Bunch
//
//1. Made Height of Spindle Center variable
//2. Made Bearing Wheel Cavities Rounded at the top for better printing
//3. Added Optional Slot opening where Spool Holder Attaches (This printed better for me this way)
//4. Changed the Center cut of the Spindle for an easier fit for me
//   Variable: OriginalCenter = 0 (Original Center Cut)
//   Variable: OriginalCenter = 1 (New Center Cut)
//
Spindle_TotHt = 97.6;           //97.6mm is what we want, 42mm for test print
Base_Ht = 13.0;                 //Height of the Base
SpindleTop_Rnd_OD = 6.0;
Spindle_OD = 16.0;
SpindleBot_Cham_OD = 4.0;
Base_OD = 80;                   //Diameter of Base
Base_Res = 360;
Slot_Open = 1;                  //Add a Slotted opening where spool Holder Base attaches
                                //This printed better for me with this added
OriginalCenter = 1;             //0 = use Original Center Cut, 1 = New Cut
//
SpindleTop_Rnd_Rad = SpindleTop_Rnd_OD / 2;
TopRnd_Translate = (Spindle_OD - SpindleTop_Rnd_OD) / 2.0;
Spindle_Ht = Spindle_TotHt - Base_Ht - SpindleTop_Rnd_Rad;
echo(Spindle_Ht = Spindle_Ht);
echo(TopRnd_Translate = TopRnd_Translate);
module TopRnd()
{
    rotate_extrude(convexity = 10, $fn = 72)
    translate([TopRnd_Translate, 0, 0])
    circle(d = SpindleTop_Rnd_OD, $fn = 28);
}
module TopSpindle()
{
    union()
    {
        translate([0,0,Base_Ht])
        cylinder(d = Spindle_OD,h=Spindle_Ht,$fn=72);
        translate([0,0,(Base_Ht+Spindle_Ht)])
        TopRnd();
        translate([0,0,Base_Ht+Spindle_Ht])
        cylinder(d = Spindle_OD-SpindleTop_Rnd_OD,h=SpindleTop_Rnd_Rad,$fn=72);
        translate([0,0,Base_Ht])
        cylinder(d1= Spindle_OD+SpindleBot_Cham_OD,d2 = Spindle_OD,h=SpindleBot_Cham_OD/2,$fn=72);
    }
}
module Base()
{
    cylinder(d=78,h=1,$fn=Base_Res);
    translate([0,0,1])
    cylinder(d=80,h=10,$fn=Base_Res);
    translate([0,0,11])
    cylinder(d=76,h=2,$fn=Base_Res);
//Add Bottom 2mm OD round
    translate([0,0,1])
    rotate_extrude(convexity = 10, $fn = Base_Res)
    translate([39, 0, 0])
    circle(d = 2, $fn = 28);   
//Add Top 4mm OD round
    translate([0,0,11])
    rotate_extrude(convexity = 10, $fn = Base_Res)
    translate([38, 0, 0])
    circle(d = 4, $fn = 28);
    TopSpindle();
}
module BearingFilamentHole()
{
    translate([12.85,0,3])
    rotate([0,90,0])
    {
        union()
        {
            cylinder(d1=0,d2=2.3,h=13.15,$fn=12);
            translate([0,0,13.14])
            cylinder(d=2.3,h=15,$fn=12);
            translate([0,0,26.36])
            cylinder(d1=2.3,d2=3.7,h=1,$fn=12);
        }
    }
}
module BearingSlot()
{
    union()
    {
        translate([0,0,3])
        rotate([0,90,0])
        scale([1,17/18,1])
        cylinder(d=18,h=4,$fn=84);
        translate([0,-8.5,-.5])
        cube([4,17,3.5]);              //Draw Basic Bearing Slot

        BearingSlotEndCham();           //Chamfer one of the Bottom Ends
        mirror([0,1,0])
        BearingSlotEndCham();           //Chamfer the other Bottom End
        translate([0,-8.5,0])
        rotate([-90,0,0])
        cylinder(d=1,h=17,$fn=4);        //Chamfer the Left Side   
        translate([4,-8.5,0])
        rotate([-90,0,0])
        cylinder(d=1,h=17,$fn=4);        //Chamfer the Right Side  
    }
}
module BearingSlotEndCham()
{
    translate([0,-8.5,0])
    rotate([0,90,0])
    cylinder(d=1,h=4,$fn=4);        //Chamfer the End
    translate([-.5,-8.5,0])
    rotate([0,90,0])
    cylinder(d1=0,d2=1,h=.5,$fn=4); //Chamfer just the Corner
    translate([4,-8.5,0])
    rotate([0,90,0])
    cylinder(d1=1,d2=0,h=.5,$fn=4);
}
module Bearing()
{
    rotate([0,90,0])
    color("red",.5)
    difference()
    {
        union()
        {
            cylinder(d1=14.68,d2=16,h=.66,$fn=72);
            translate([0,0,.66])
            cylinder(d=16,h=1.68,$fn=72);
            translate([0,0,.66+1.68])
            cylinder(d1=16,d2=14.68,h=.66,$fn=72);
        }
        translate([0,0,-1])
        cylinder(d=2.61,h=5,$fn=12);
    }
}
module OriginalCavity()
{
    rotate_extrude($fn=76)polygon(points = 
    [[0,-1],[-10.31,-1],[-10.31,0],[-8.37,1.51],[-5.75,12],
    [-5.74,20],[-4.4,25],[-5.74,30],[-5.75,35],[-5.73,35.43],
    [-5.68,35.87],[-5.58,36.29],[-5.45,36.71],[-5.28,37.11],[-5.08,37.5],
    [-4.85,37.87],[-4.58,38.21],[-4.29,38.53],[-3.96,38.83],[-3.62,39.09],
    [-3.25,39.33],[-2.86,39.53],[-2.46,39.7],[-2.05,39.83],[-1.62,39.92],
    [-1.19,39.98],[-0.75,40],[0,40]]);
}
module NewCavity()
{
//Cut out Bottom Center Cylinder cuts
    translate([0,0,-.01])
    cylinder(d1=20.62,d2=16.75,h=1.59,$fn=76);
    translate([0,0,1.57])
    cylinder(d1=16.75,d2=11.53,h=10.43,$fn=76);
    translate([0,0,11.99])
    cylinder(d=11.53,h=8.01,$fn=76);
    translate([0,0,19.99])
    cylinder(d1=11.53,d2=8.82,h=5.01,$fn=76);
    translate([0,0,24.99])
    cylinder(d1=8.82,d2=11.52,h=5.01,$fn=76);
    translate([0,0,29.99])
    cylinder(d=11.52,h=5.01,$fn=76);
    translate([0,0,35])
    scale([1,1,.9])         //Match original spherical cut
    sphere(d=11.52,$fn=76);
}
module DrawFinal()
{
    difference()
    {
        Base();                 //Draw the Main Base before Cutting
//Add Bearing wheel cavities ever 30 degrees
        for (a =[0:5])
        {
            echo(a*60);
            rotate([0,0,a*60])
            translate([33,0,0])
            BearingSlot();
            rotate([0,0,a*60])
            translate([33.5,0,3])
            %Bearing();
            rotate([0,0,a*60])
            BearingFilamentHole();
        }
        if (OriginalCenter == 0)
        {
            OriginalCavity();;
        } else
        {
            NewCavity();
        }
//Add slot cut on both side of Spindle attachment for better printing on my machine
        if (Slot_Open == 1)
        {
            translate([-10.3,-2.5,13])
            cube([20.6,5,26]);
            translate([0,0,39])
            rotate([0,90,0])
            cylinder(d=5,h=20,$fn=4,center=true);   //Cut top of slot to 45 degrees
        }
//        translate([-50,-100,-1])
//        cube([100,100,100]);            //For Section cut test
    }
}
DrawFinal();