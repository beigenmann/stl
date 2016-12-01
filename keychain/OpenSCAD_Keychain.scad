use <write/Write.scad>

/* [Global] */

quality=30;

/* [Parameters] */

//set to false if no lug is desired
build_lug=1; // [0:false, 1:true]

plate_thickness = 1.0;
label_thickness = 0.6;
frame_thickness = 1.0;

/* [Text] */

text_line_1 = "OpenSCAD";
font_height = 6;
label_font="orbitron.dxf"; //[orbitron.dxf,Letters.dxf,knewave.dxf,BlackRose.dxf,braille.dxf]

/* [Frame] */

frame_width = 2.0;
frame_space = 2.0;
frame_rounding_inner = 2.0;
frame_rounding = frame_rounding_inner + frame_width;

/* [Lug] */

hole_diameter=4.0;
lug_thick=2.0;
lug_diameter=hole_diameter+2*lug_thick;		

/* [Hidden] */

lines=[
	text_line_1,
	str(version()[0],".",version()[1],".",version()[2]),
];

chars_per_line = max(len(lines[0]),len(lines[1]));
number_of_lines = 2;

function get_text_width() = chars_per_line*11/16*font_height;
function get_text_height() = (1.5*number_of_lines-.5)*font_height;

// Ok, lets build the keychain!
union()
{
	build_plate();
	write_lines(lines);
}

module build_lug()
assign(h=plate_thickness+frame_thickness)
translate([-(hole_diameter+frame_rounding_inner)/2*sqrt(.5), (hole_diameter+frame_rounding_inner)/2*sqrt(.5), 0])
difference()
{
	union()
	{
		cylinder(r=lug_diameter/2,h=h, $fn=quality);

		rotate([0,0,-45])
		translate([0,-lug_diameter/2,0])
		cube([lug_diameter,lug_diameter,h]);
	}

	cylinder(r=hole_diameter/2,h=h, $fn=quality);
}

module build_plate()
assign(x0=frame_rounding_inner,y0=frame_rounding_inner)
assign(x1=get_text_width()+2*frame_space-frame_rounding_inner)
assign(y1=get_text_height()+2*frame_space-frame_rounding_inner)
difference()
{
	union()
	{
		hull()
		for(x=[x0,x1],y=[-y0,-y1])
		translate([x,y,0])
		cylinder(r=frame_rounding,h=plate_thickness+label_thickness, $fn=quality);

		hull()
		for(x=[x0,x1],y=[-y0,-y1])
		translate([x,y,0])
		cylinder(r=(frame_rounding+frame_rounding_inner)/2,h=plate_thickness+frame_thickness, $fn=quality);

		if(build_lug)
			build_lug();
	}

	hull()
	for(x=[x0,x1],y=[-y0,-y1])
	translate([x,y,plate_thickness])
	cylinder(r=frame_rounding_inner,h=frame_thickness+.1, $fn=quality);
}

module write_lines(lines)
for(idx=[0:len(lines)])
write_line(idx, lines[idx]);

module write_line(idx, text)
if(len(text)>0)
{
	translate([frame_space,-frame_space-(1.5*(idx+1)-.5)*font_height,plate_thickness])
	write(text, h=font_height, t=label_thickness, font=label_font, center=false);
}

