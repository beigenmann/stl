include <i3 support.scad>
include <frame.scad>

i3_SUPPORT_SPACE = 139;
i3_SUPPORT_OFFSET = 86;
i3_FRAME_THICKNESS = 6;

module i3frame() {
	translate([i3_SUPPORT_SPACE,i3_SUPPORT_OFFSET,0]) rotate([90,0,90]) i3Support();
	translate([-1 * i3_SUPPORT_SPACE - i3_FRAME_THICKNESS,i3_SUPPORT_OFFSET,0]) rotate([90,0,90]) i3Support();
	rotate([90,0,0]) frame();
	
	translate([0,160,-155]) rotate([0,90,0]) cylinder(r=4, h=380, center=true);
}

PSU_WIDTH = 114;
PSU_LENGTH = 215;
PSU_HEIGHT = 50;
PSU_INSET = 18;
PSU_WALL = 2;
PSU_TERMINAL = 8.3;

module powerSupply() {
	difference() {
		cube([PSU_WIDTH, PSU_LENGTH, PSU_HEIGHT], center = true);
		translate([0,(PSU_LENGTH / 2) - (PSU_INSET / 2),PSU_TERMINAL / 2])
			cube([PSU_WIDTH - (PSU_WALL * 2),PSU_INSET,PSU_HEIGHT - PSU_TERMINAL], center = true);
	}
}

module powerSocket() {
	translate([20,0,-5]) cylinder(r=1.7, h=22, center=true);
	translate([-20,0,-5]) cylinder(r=1.7, h=22, center=true);
	hull() {
		minkowski() {
			cube([20.5,12.5,3], center=true);
			cylinder(r=5,h=0.1);
		}
		translate([20,0,0]) cylinder(r=5, h=3, center=true);
		translate([-20,0,0]) cylinder(r=5, h=3, center=true);
	}
	translate([0,0,-5.5 - 1.5])
		minkowski() {
			cube([20,12,11], center=true);
			cylinder(r=4,h=0.1);
		}
}

module powerSwitch() {
	cube([14.8,20.8,2], center=true);
	translate([0,0,-7-1]) cube([13,19.8,14], center=true);
}

PC_DEPTH = 40;
PC_THICKNESS = 3;

module powerCover() {
	difference() {
		translate([0,(PSU_LENGTH / 2) + (PC_DEPTH  - PSU_INSET) / 2,0]) 
			difference() {
				cube([PSU_WIDTH, PSU_INSET + PC_DEPTH, PSU_HEIGHT], center=true);
				innerArea();
				translate([0,-10,0]) innerArea();
				translate([0,0,-10]) innerArea();

				//screw holes
				translate([0,(PSU_INSET + PC_DEPTH)/-2 + (PSU_INSET - 6.5),3]) rotate([0,90,0]) cylinder(r=1.5, h=PSU_WIDTH*2, center=true);

				//Power Socket Hole
				translate([0.5*PSU_WIDTH + 0,10,0]) rotate([0,90,0]) powerSocket();
				
				//Power Switch Hole
				translate([0,PSU_INSET/2,(PSU_HEIGHT / 2) + 1]) rotate([0,0,90]) powerSwitch();
				
				//DC Wire Exit Hole
				translate([PSU_WIDTH/2 - 108,PC_DEPTH/2,PSU_HEIGHT / -2 + 6]) rotate([90,0,0]) cylinder(r=3,h=20, center=true);
			}	
		powerSupply();
	}
}

module innerArea() {
	cube([PSU_WIDTH - (PC_THICKNESS * 3), PSU_INSET + PC_DEPTH - (PC_THICKNESS * 2),PSU_HEIGHT - (PC_THICKNESS * 2)], center=true);
}

powerCover();

/*color("GhostWhite") i3frame();
translate([i3_SUPPORT_SPACE + i3_FRAME_THICKNESS + (PSU_HEIGHT /  2),PSU_WIDTH / 2,0]) rotate([90,180,90]) {
	powerSupply();
	powerCover();
}*/
