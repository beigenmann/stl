//excelvan spool holder
$fn=500;
module spoolholder(id, _608z,thbearing,od){
    odrim = od +10;
    difference(){
        union(){
            cylinder(h=20,d1=od,d2=od-4);
            cylinder(h=4,d=odrim);
        }
        cylinder(h=7,d=_608z);
        cylinder(h=40,d=id);
    }
}

spoolholder(10,22.5,17,52);