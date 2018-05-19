//excelvan spool holder
$fn=500;
module spoolholder(id, _608z,thbearing,od){
    odrim = od +10;
    difference(){
        union(){
            cylinder(h=30,d1=od, d2=od-4);
            cylinder(h=4,d=odrim);
        }
        translate([0,0,15]) cylinder(h=15,d=_608z);
        cylinder(h=3,d=thbearing);
        cylinder(h=40,d=id);
    }
}

spoolholder(10,22.5,17,53);