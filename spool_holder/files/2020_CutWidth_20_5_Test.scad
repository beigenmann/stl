//Test Print for Aluminum Extrusion Slide Fit
AL_Wid = 20.5;        //Width of cut for 2020 Aluminum
AL_Wid2 = AL_Wid / 2;
Len = 25;               //Length of Test
Ht = 24;                //height of Test
Base_Ht = 4;            //Base Height
Weld_OD = 12;           //Outside Weld Diameter to make it Stiffer Slide Test
Weld_Rad = Weld_OD / 2;
module Welds()
{
    translate([0,-(AL_Wid2+3),0])
    rotate([0,90,0])
    cylinder(d=Weld_OD,h=Len,$fn=4);
    translate([0,(AL_Wid2+3),0])
    rotate([0,90,0])
    cylinder(d=Weld_OD,h=Len,$fn=4);
}
difference()
{
    union()
    {
        translate([0,-(AL_Wid2+3),0])
        cube([Len,AL_Wid+6,Ht]);
        Welds();
    }
    translate([-1,-AL_Wid2,Base_Ht])
    cube([Len+2,AL_Wid,Ht]);
    translate([0,0,-10])
    cylinder(d=100,h=10);
    translate([-1,-(AL_Wid2+(Weld_Rad)+10),-1])
    cube([Len+2,10,10]);
    translate([-1,(AL_Wid2+(Weld_Rad)),-1])
    cube([Len+2,10,10]);
}