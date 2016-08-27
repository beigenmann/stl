//Remix of Spool Holder Base for 2020 extrusion
//Remixed from: http://www.thingiverse.com/thing:508896
//8/4/2016      By: David Bunch
//
//These 3 variables used to show the complete part in the View Area (Comment out if you do not want this)
//$vpt=[36,-3.9,64];
//$vpr =[67.6,0,68.4];
//$vpd =422;

T_Nut_Hole_OD = 4.8;    //T-Nut Hole Diameter (I am using M4 screws)
                        //Original Hole was 5.4mm OD
T_Nut_Hole_Thick = 5;   //How thick of plastic for M4 Screw Head to Rest against
                        //5 should work for M4x10 & 7 should work for M4x12 
T_Nut_Hole_Res = 20;    //T-Nut Hole Hole Resolution
Base_Res = 252;         //252 gives about 1mm segments (Resolution of Outer 80mm Diameter Cylinder)

Bot45_Thk = 4;          //This is the Thickness of base that touches Print bed

AL_Wid = 20.5;          //Width of cut for Aluminum
OriginalCenter = 1;     //0 = Original Profile of Center Shaft
                        //1 = New Profile of Center Shaft
Slot_Opening = 2;       //0 = No Slot
                        //1 = Slot,
                        //2 = Slot with .3mm bottom (Adding this gives me a better print)
                        //This gives 1 layer of plastic at the bottom of the slot
                        //(Just cut the thin plastic in slots with small wire cutters)
T_Nut_Hole_Rad = T_Nut_Hole_OD / 2;
AL_Wid2 = AL_Wid / 2;   //half the Aluminum extrusion width

echo(AL_Wid = AL_Wid);
echo(AL_Wid2 = AL_Wid2);

module TaperTop2020()
{
    translate([0,-36.6,20.37])
    rotate([90,0,0])
    hull()
    {
        scale([1,12.12/21,1])
        cylinder(d=21,h=.1,$fn=4);
        translate([0,0,3.4])
        scale([1,15.19/24.07,1])
        cylinder(d=24.07,h=.1,$fn=4);
    }
}
module Profile()
{
    rotate_extrude(convexity = 10,$fn=Base_Res)polygon(points = 
    [[39.99,0],[0,0],[0,51.63],[31.8,51.63],[32,51.61],
    [32.18,51.55],[32.36,51.46],[32.51,51.34],[32.63,51.19],[32.72,51.01],
    [32.78,50.83],[32.8,50.63],[32.8,47.63],[37,47.63],[37,50.63],
    [37.02,50.83],[37.08,51.01],[37.17,51.19],[37.29,51.34],[37.44,51.46],
    [37.62,51.55],[37.8,51.61],[38,51.63],[39,51.63],[39.19,51.61],
    [39.38,51.55],[39.55,51.46],[39.7,51.34],[39.83,51.19],[39.92,51.01],
    [39.98,50.83],[40,50.63]]);
}
//I did the top shaft sperately so as not to have overkill of resolution of spindel
module TopShaft_Original()
{
    rotate_extrude(convexity = 10,$fn=64)polygon(points = 
    [[2.99,90.3],[3.33,90.13],[3.66,89.93],[3.97,89.69],[4.29,89.43],
    [4.51,89.14],[4.74,88.83],[4.94,88.49],[5.1,88.14],[5.23,87.78],
    [5.32,87.4],[5.38,87.02],[5.4,86.63],[5.4,82.63],[4.06,77.63],
    [5.12,72.62],[5.11,65.13],[6.92,54.95],[7.01,54.55],[7.13,54.17],
    [7.3,53.81],[7.5,53.46],[7.73,53.14],[7.99,52.84],[8.29,52.57],
    [8.6,52.33],[8.94,52.12],[9.3,51.94],[9.68,51.81],[10.06,51.71],
    [10.46,51.65],[10.86,51.63],[10.86,50.63],[0,50.63],[0,90.3]]);
}
module TopShaft_New()
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
    }
}
module CutAl_Path()
{
    translate([-AL_Wid2,-50,-1])
    cube([AL_Wid,100,21.37]);

    CutAl_TopPath();
    translate([0,0,-.1])
    for (a =[0:1])
    {
        mirror([0,a,0])
        hull()
        {
            Cham_AlumPathEnd();
            translate([0,0,-22])
            Cham_AlumPathEnd();
        }
    }
}

module CutAl_TopPath()
{
    translate([0,0,20.37])
    scale([1,1,12.12/AL_Wid])
    rotate([90,0,0])
    cylinder(d=AL_Wid,h=100,$fn=4,center=true);
}
module Cham_AlumPathEnd()
{
    translate([0,36.3,20.37])
    scale([1,1,12.12/AL_Wid])
    rotate([-90,0,0])
    cylinder(d1=AL_Wid,d2=34,h=4,$fn=4);
}
module ChamSide()
{
    translate([-(AL_Wid2 + Bot45_Thk),0,0])
    rotate([0,-45,0])
    translate([-100,-50,0])
    cube([100,100,100]);
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
module ArmCut1()
{
    linear_extrude(height = .1, center = false, convexity = 10)polygon(points = 
    [[-6,28.63],[6,28.63],[6,31.63],[9,34.07],[4.66,39.41],
    [4.29,39.83],[3.87,40.21],[3.43,40.55],[2.95,40.85],[2.45,41.11],
    [1.93,41.31],[1.39,41.47],[0.84,41.57],[0.28,41.62],[-0.28,41.62],
    [-0.84,41.57],[-1.39,41.47],[-1.93,41.31],[-2.45,41.11],[-2.95,40.85],
    [-3.43,40.55],[-3.87,40.21],[-4.28,39.83],[-4.66,39.41],[-9,34.07],
    [-6,31.63]]);
}
module ArmCut2(AC_Ht = .1)
{
    linear_extrude(height = AC_Ht, center = false, convexity = 10)polygon(points = 
    [[-8.66,29.63],[-8.66,28.63],[8.66,28.63],[8.66,29.63],[8.71,30.34],
    [9.09,30.63],[12.73,33.68],[11.85,34.79],[7.6,40.14],[6.8,41.15],
    [6.65,41.33],[6.46,41.55],[6.26,41.77],[5.96,42.06],[5.66,42.33],
    [5.34,42.59],[5.01,42.83],[4.89,42.92],[4.61,43.1],[4.32,43.27],
    [3.96,43.47],[3.59,43.65],[3.12,43.85],[2.83,43.95],[2.44,44.08],
    [2.04,44.18],[1.69,44.26],[1.34,44.32],[1.23,44.34],[0.82,44.39],
    [0.41,44.42],[0,44.43],[-0.44,44.42],[-0.84,44.39],[-1.23,44.34],
    [-1.63,44.27],[-2.04,44.18],[-2.23,44.14],[-2.53,44.05],[-2.83,43.95],
    [-3.21,43.81],[-3.59,43.65],[-4,43.45],[-4.32,43.27],[-4.67,43.06],
    [-5.01,42.83],[-5.34,42.59],[-5.66,42.33],[-5.77,42.23],[-6.02,42],
    [-6.25,41.77],[-6.53,41.47],[-6.8,41.15],[-7.53,40.23],[-8.4,39.14],
    [-9.27,38.05],[-10.14,36.96],[-11,35.87],[-11.85,34.79],[-12.7,33.72],
    [-12.73,33.68],[-12.7,33.66],[-11.85,32.94],[-11,32.22],[-10.14,31.51],
    [-9.27,30.78],[-8.71,30.34],[-8.66,29.63]]);
}
module ArmCut3()
{
    linear_extrude(height = .5, center = false, convexity = 10)polygon(points = 
    [[10.66,28.63],[10.66,29.34],[15.51,33.39],[13.42,36.04],[9.17,41.39],
    [8.35,42.41],[8.18,42.62],[7.94,42.89],[7.69,43.16],[7.34,43.51],
    [6.96,43.85],[6.57,44.17],[6.19,44.45],[6.02,44.57],[5.67,44.8],
    [5.31,45.01],[4.87,45.25],[4.41,45.47],[3.85,45.71],[3.47,45.85],
    [3,46],[2.51,46.13],[2.08,46.22],[1.68,46.29],[1.51,46.32],
    [1.01,46.38],[0.51,46.42],[0,46.43],[-0.55,46.41],[-1.03,46.38],
    [-1.51,46.32],[-2.01,46.24],[-2.49,46.13],[-2.74,46.07],[-3.11,45.96],
    [-3.48,45.84],[-3.96,45.67],[-4.42,45.47],[-4.92,45.23],[-5.32,45.01],
    [-5.75,44.75],[-6.17,44.47],[-6.58,44.16],[-6.94,43.86],[-7.09,43.73],
    [-7.4,43.45],[-7.7,43.15],[-8.03,42.79],[-8.34,42.42],[-9.09,41.48],
    [-9.97,40.38],[-10.84,39.29],[-11.7,38.2],[-12.56,37.12],[-13.42,36.03],
    [-14.26,34.96],[-15.58,33.32],[-13.94,32.09],[-13.14,31.41],[-12.28,30.69],
    [-11.42,29.97],[-10.66,29.33],[-10.66,28.63]]);
}

module ChamArm()
{
    translate([37.93,0,0])
    rotate([0,0,90])
    rotate([90,0,0])
    hull()
    {
        ArmCut2();
        translate([0,0,2.1])
        ArmCut3();
    }
}

module ArmCut()
{
    rotate([0,0,90])
    rotate([90,0,0])
    {
        hull()
        {
            ArmCut1();
            translate([0,0,39])
            ArmCut2();
        }
        translate([0,0,39])
        ArmCut2(2);
    }
}
module Tnut_RecessHole()
{
    translate([AL_Wid2 + T_Nut_Hole_Thick,0,10.37])
    rotate([0,90,0])
    cylinder(d=14,h=20,$fn=64);
    translate([AL_Wid2 + T_Nut_Hole_Thick,-7,-1])
    cube([20,14,11.37]);
}
module TaperBotArmCut()
{
    translate([41.,0,28.63])
    scale([1.5,1,1])
    rotate([90,0,0])
    {
        cylinder(d=4.1,h=17,$fn=4,center=true);
        translate([0,0,17/2])
        cylinder(d1=4.1,d2=0,h=3.5,$fn=4);
        translate([0,0,-((17/2)+3.5)])
        cylinder(d1=0,d2=4.1,h=3.5,$fn=4);
    }
}
module SlotOpen(S_Cut = 11.37,S_Ht = -1)
{
        translate([-50,-T_Nut_Hole_Rad,S_Ht])
        cube([100,T_Nut_Hole_OD,S_Cut]);                   //Make Top Hole a slot
}
module DrawBase()
{
    difference()
    {
        union()
        {
            Profile();
            if (OriginalCenter == 1)
            {
                TopShaft_New();
            } else
            {
                TopShaft_Original();
            }
        }
        CutAl_Path();
        ChamSide();

        mirror([1,0,0])
        ChamSide();
        TopSlice();         //Slice opening in Shaft
        ArmCut();
        ChamArm();
        Tnut_RecessHole();
        mirror([1,0,0])
        Tnut_RecessHole();


        translate([-AL_Wid2,38.6,-1])
        cylinder(d=4,h=21.37,$fn=4);
        translate([AL_Wid2,38.6,-1])
        cylinder(d=4,h=21.37,$fn=4);
        TaperTop2020();
        mirror([0,1,0])
        TaperTop2020();
        TaperBotArmCut();
//Make the 2020 T-Nut Connection Hole
        translate([0,0,10.37])
        rotate([0,90,0])
        cylinder(d=T_Nut_Hole_OD,h=100,$fn=T_Nut_Hole_Res,center=true);     //T-Nut hole all the way thru
//Add Slotted hole if asked for
        if (Slot_Opening > 0)
        {
            if (Slot_Opening == 1)
            {
                SlotOpen(11.37,-1);
            } else
            {
                SlotOpen(10.07,.3);         //Leave .3mm thick plastic at bottom of slot
            }
        }
//    translate([-50,-100,-1])      //Check Internal Structure
//    cube([100,100,100]);          //with Section Cut
    }
}
rotate([0,0,90])        //I like the main part to run along the X-axis for printing
DrawBase();