//Remix of Bearing Wheel to convert to openscad
//Remixed from: http://www.thingiverse.com/thing:508896
//8/5/2016  By: David Bunch
//
//I did not change any of the dimensions from the original version for this part
Wid = 3.0;                          //Total Width of Bearing
OD = 16;                            //Outside Diameter of Bearing Wheel
Cham_OD = 14.68;                    //Outside Chamfer Diameter
ChamOD_Ht = .66;                    //Outside Chamfer Height (or width)
ID = 2.61;                          //Inside Diameter of Wheel bearing (2.61 = original)
Cham_ID = 3.2;                      //Inside Chamfer Diameter
ChamID_Ht = .3;                     //Inside Chamfer Height (or width)
Qty = 6;                            //Quantity of parts, 1,2,3,4,5 or 6
OD_Wid = Wid - (2 * ChamOD_Ht);     //Width of OD diameter without the chamfer

OD_Res = (round(((OD * 3.14)/4)/.7)*4);         //Resolution of Outside Diameter
ID_Res = (round(((Cham_ID * 3.14)/4)/.7)*4);    //Resolution of Inside Diameter
echo(OD_Wid = OD_Wid);
echo(OD_Res = OD_Res);
echo(ID_Res = ID_Res);

module BearingWheel()
{

    difference()
    {
        union()
        {
            cylinder(d1=Cham_OD,d2=OD,h=ChamOD_Ht,$fn=OD_Res);
            translate([0,0,ChamOD_Ht])
            cylinder(d=OD,h=OD_Wid,$fn=OD_Res);
            translate([0,0,Wid - ChamOD_Ht])
            cylinder(d1=OD,d2=Cham_OD,h=ChamOD_Ht,$fn=OD_Res);
        }
        translate([0,0,-1])
        cylinder(d=ID,h=5,$fn=ID_Res);
        translate([0,0,-.01])
        cylinder(d1=Cham_ID,d2=ID,h=ChamID_Ht+.01,$fn=ID_Res);
        translate([0,0,Wid - ChamID_Ht])
        cylinder(d1=ID,d2=Cham_ID,h=ChamID_Ht+.01,$fn=ID_Res);
    }
}
for (a =[0:Qty-1])
{
    echo(a);
    if (a < 3)
    {
        translate([(a * (OD + 3)),0,0])
        BearingWheel();
    } else
    {
        translate([((a-3) * (OD + 3)),OD + 3,0])
        BearingWheel();
    }

}
