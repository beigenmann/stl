// Stephen Stair 2014 (sgstair@akkit.org)
// Openbeam Kossel Spool Holder
// Ground up recreation of the thing here: http://www.thingiverse.com/thing:209294


beamsize = 15;
beamgapwidth = 3;
beamgapdepth=3;

beam_grip = 0.5;

interface_height = 37;
interface_overlap = beamsize*.85;

interface_smooth = 1;

wall = 2.5;
screw_wall = 3.5;
screw_size = 3.5;
screw_reinforce_radius = 7/2;


screw_low = 6;
screw_mid = interface_height/2;
screw_high = interface_height-6;

holder_length = 95;
holder_radius = (beamsize+wall*2)/2;
holder_height = 4;
holder_retain = 6;

support_size = 12;
support_wall = 4;

$fs = 0.1;
$fa = 11;


module beam(length)
{
	difference() {
		translate([-beamsize/2,-beamsize/2,0])
			cube([beamsize,beamsize,length]);

		translate([-beamsize/2,0,0])
			cube([beamgapdepth*2,beamgapwidth,length*3],center=true);
		translate([beamsize/2,0,0])
			cube([beamgapdepth*2,beamgapwidth,length*3],center=true);

		translate([0,-beamsize/2,0])
			cube([beamgapwidth,beamgapdepth*2,length*3],center=true);
		translate([0,beamsize/2,0])
			cube([beamgapwidth,beamgapdepth*2,length*3],center=true);
   }
}


module screw_reinforce()
{
	rotate([0,90,0])
		cylinder(r1=screw_reinforce_radius+screw_wall, r2 = screw_reinforce_radius,h=screw_wall);
  
}

module beam_interface()
{
	difference() {
		union()
		{
			// core wall

			// Round corners of interface base surface.
			minkowski()
      	{
				translate([0,0,interface_height/2])
					cube([beamsize+wall*2-interface_smooth*2, beamsize+wall*2-interface_smooth*2, interface_height-1],center=true);

				cylinder(r = interface_smooth, h=1, center=true);
			}

			// Add reinforcement around screw holes
			translate([beamsize/2,0,screw_low])
				screw_reinforce();			

			translate([beamsize/2,0,screw_high])
				screw_reinforce();

			translate([0,beamsize/2,screw_mid])
				rotate([0,0,90])
					screw_reinforce();

			translate([0,-beamsize/2,screw_mid])
				rotate([0,0,-90])
					screw_reinforce();
		}


		cube([beamsize-beam_grip*2,beamsize-beam_grip*2,interface_height*3],center=true);

		translate([-beamsize*1.5-interface_overlap,0,0])
			cube([beamsize*4,beamsize*4,interface_height*3],center=true);

		translate([0,0,-5]) beam(10+interface_height);

		// Cut off anything above the top
		translate([-beamsize*2,-beamsize*2,interface_height])
			cube([beamsize*4,beamsize*4,beamsize*4]);

		// Cut off anything below the bottom
		translate([-beamsize*2,-beamsize*2,-beamsize*4])
			cube([beamsize*4,beamsize*4,beamsize*4]);



		// screw holes

		translate([beamsize/2-2,0,screw_low])
			rotate([0,90,0])
				#cylinder(r=screw_size/2,h=screw_wall+4);

		translate([beamsize/2-2,0,screw_high])
			rotate([0,90,0])
				#cylinder(r=screw_size/2,h=screw_wall+4);

		translate([0,beamsize/2-2,screw_mid])
			rotate([-90,0,0])
				#cylinder(r=screw_size/2,h=screw_wall+4);

		translate([0,-beamsize/2+2,screw_mid])
			rotate([90,0,0])
				#cylinder(r=screw_size/2,h=screw_wall+4);
	}
}

module holder()
{
   // Calculate size of shapes to be removed below the holder
	remove_base_height = holder_height + holder_radius - (holder_radius-wall);
   
	remove_start = beamsize/2+wall-2;
	remove_length = holder_length+wall*4;
	remove_base_width = holder_radius*2-wall*2;
   remove_angle_size = (holder_radius-wall)*sqrt(2);

	difference()
	{
		union()
		{
			translate([beamsize/2+wall-1,0,holder_height])
				rotate([0,90,0])
					cylinder(r=holder_radius,h=holder_length+2);

			translate([beamsize/2+wall-1, -holder_radius, 0])
				cube([holder_length+2, holder_radius*2, holder_height]);
	
			translate([beamsize/2+wall+holder_length,0,holder_height + holder_retain])
				rotate([0,90,0])
					cylinder(r=holder_radius,h=wall);
	
			translate([beamsize/2+wall+holder_length, -holder_radius, 0])
				cube([wall, holder_radius*2, holder_height+holder_retain]);
		}

		translate([0,-holder_radius*2,-holder_radius*2])
			cube([remove_length*2,holder_radius*4,holder_radius*2]);
		translate([remove_start,-remove_base_width/2, -holder_radius*2])
			cube([remove_length,remove_base_width, remove_base_height + holder_radius*2]);

		difference()
		{
			translate([0,0,remove_base_height])
				rotate([45,0,0])
					translate([remove_start,-remove_angle_size/2,-remove_angle_size/2])
				      cube([remove_length, remove_angle_size,remove_angle_size]);

			translate([0,-holder_radius*2,remove_base_height + holder_radius - wall*1.5])
				cube([remove_length*2, holder_radius*4, holder_radius]);
		}

	}
}

module support()
{
	base_size = support_size*2/sqrt(2);

	translate([beamsize/2+wall,0,holder_height + holder_radius - wall/2])
	difference()
	{
		rotate([90,45,0])
   		cube([base_size,base_size,support_wall],center=true);

		translate([-base_size*2-wall/2,-base_size,-base_size])
			cube([base_size*2,base_size*2,base_size*2]);

		translate([-base_size,-base_size,-base_size*2])
			cube([base_size*2,base_size*2,base_size*2]);

	}
}


union()
{
	beam_interface();
	holder();
	support();
}