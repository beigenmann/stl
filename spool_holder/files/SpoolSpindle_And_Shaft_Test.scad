//Test Original & New Spindle Cavity And Shaft
//Source from: http://www.thingiverse.com/thing:508896
//8/11/2016     By: David Bunch
//
Spindle_TotHt = 44.82;           //97.6mm is what we want, 42.82 (Match Tallest Shaft Print Height)
Base_Ht = 13.0;                 //Height of the Base
SpindleTop_Rnd_OD = 6.0;
Spindle_OD = 16.0;
SpindleBot_Cham_OD = 4.0;
OriginalCenter = 1;      //0 = use Original Center Cut, 1 = New Cut
//
SpindleTop_Rnd_Rad = SpindleTop_Rnd_OD / 2;
TopRnd_Translate = (Spindle_OD - SpindleTop_Rnd_OD) / 2.0;
Spindle_Ht = Spindle_TotHt - Base_Ht - SpindleTop_Rnd_Rad;
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
module TestBase()
{
    cylinder(d1=24,d2=20,h=13);
    TopSpindle();
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
module DrawSpindleTest()
{
    difference()
    {
        TestBase();
        if (OriginalCenter == 0)
        {
            OriginalCavity();;
        } else
        {
            NewCavity();
        }
        //translate([0,-50,-1])
        //cube([100,100,100]);      //Section Cut
    }
}
//Test Original & New Shaft
module TopShaft_Original()
{
    union()
    {
        rotate_extrude(convexity = 10,$fn=64)polygon(points = 
        [[2.99,90.3],[3.33,90.13],[3.66,89.93],[3.97,89.69],[4.29,89.43],
        [4.51,89.14],[4.74,88.83],[4.94,88.49],[5.1,88.14],[5.23,87.78],
        [5.32,87.4],[5.38,87.02],[5.4,86.63],[5.4,82.63],[4.06,77.63],
        [5.12,72.62],[5.11,65.13],[6.92,54.95],[7.01,54.55],[7.13,54.17],
        [7.3,53.81],[7.5,53.46],[7.73,53.14],[7.99,52.84],[8.29,52.57],
        [8.6,52.33],[8.94,52.12],[9.3,51.94],[9.68,51.81],[10.06,51.71],
        [10.46,51.65],[10.86,51.63],[10.86,50.63],[0,50.63],[0,90.3]]);
        translate([0,0,51.63-6])
        cylinder(d=21.71,h=6,$fn=64);
    }
}
module TopShaft()
{
//Cut out Bottom Center Cylinder cuts
    translate([0,0,51.63])
    union()
    {
        translate([0,0,-.01])
        cylinder(d1=19.32,d2=15.46,h=1.52,$fn=76);
        translate([0,0,1.51])
        cylinder(d1=15.46,d2=10.24,h=10.48,$fn=76);
        translate([0,0,10.48+1.51])
        cylinder(d=10.24,h=8,$fn=76);
        translate([0,0,10.48+1.51+8])
        cylinder(d1=10.24,d2=8.12,h=5,$fn=76);
        translate([0,0,10.48+1.51+8+5])
        cylinder(d1=8.12,d2=10.79,h=5,$fn=76);
        translate([0,0,10.48+1.51+8+5+5])
        cylinder(d=10.79,h=5.01,$fn=76);
        translate([0,0,35])
        scale([1,1,.85])         //Match original spherical top
        sphere(d=10.79,$fn=76);
        translate([0,0,-6])
        cylinder(d=19.32,h=6,$fn=76);
    }
}
module TopSlice()
{
    rotate([90,0,0])
    linear_extrude(height = 100, center = true, convexity = 10)polygon(points = 
    [[1.65,91.3],[1.65,90.3],[0.46,54.94],[-0.46,54.94],[-1.73,90.27],
    [-1.73,91.3]]);
    translate([0,0,54.94])
    cylinder(d1=3.5,d2=6.04,h=36.37,$fn=28);
}
module DrawFinalShaft()
{
    translate([0,0,-51.63+6])
    difference()
    {
        if (OriginalCenter == 1)
        {
            TopShaft();
        } else
        {
            TopShaft_Original();
        }
        TopSlice();
        translate([0,0,51.63-3])
        rotate([0,90,0])
    
        cylinder(d=3,h=30,center=true,$fn=16);  //insert allen wrench to remove test shaft
    }
}
rotate([0,0,90])            //Line up slice with X-axis
DrawFinalShaft();
translate([28,0,0])
DrawSpindleTest();