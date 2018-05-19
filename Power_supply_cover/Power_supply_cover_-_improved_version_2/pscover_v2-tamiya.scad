//////////////////////////////////////////////////////////////////////////////////////
///
///  Yet another power supply cover!
///
///  Improved version with:
///  - air flow grid on front side
///  - cutout for voltage adjustment tripot
///  - clips to secure Molex connectors
///
///  It's for the inexpesive 360W 12V/30A powersupply offered on eBay for under $30.
///  It is designed for the following additional components:
///  - 1pc standard IEC320 C14 AC inlet power socket
///  - 1pc mini on-off rocker switch 3A 250V 15mmx11mm (KCD1)
///  - 1-3 pcs large Molex 2-pin power connectors
///
//////////////////////////////////////////////////////////////////////////////////////
///
///  2014-01-27 Heinz Spiess, Switzerland
///  2014-08-28 Heinz Spiess, Switzerland (Tamiya connectors added)
///
///  released under Creative Commons - Attribution - Share Alike licence
//////////////////////////////////////////////////////////////////////////////////////

// power supply dimensions
psw = 114;// width fo power supply
psh = 50; // height of power supply
psd = 19; // depth inside power supply
psa = 2.0;// thickness of alu sheets
psb = 9;  // thickness of ps bottom

// molex female plug dimensions
mow = 15; // width of molex socket
moh = 8.5; // height of molex socket
moc = 1.5;   // extra height of clip
mod = 18;  // depth of molex in case
mox = 0;  // position of molex sockets
mon = 3;   // number of molex slots

//tamiya female plug dimensions
tyw = 32; // width of tamiya socket
tyh = 17; // height of tamiya socket
tyH = 10; // height of tamiya socket
tyc = 0;   // extra height of clip
tyd = 3;  // depth of tamiya in case
tyD = 36;  // depth of tamiya in case
tyb = 1.5; // height of brims
tyx = 0;  // position of tamiya sockets
tyn = 1;   // number of tamiya slots

// ac socket dimensions
act = 50;  // total width of ac socket
acw = 27;  // width of ac socket
ach = 20;  // height of ac socket
acs = 40;  // screw distance of ac socket
acc = 8;   // corner length

// ac switch
sww = 20;  // switch width
swh = 13;   // switch height

// lcd voltage display
vdw = 46; // width
vdh = 28; // height
vdd = 6;  // depth
vds = 28; // screw base
vdx = psw/4-5; //lcd x-position

//
exd = 50; // extruding depth behind power supply
wall = 3; // wall thickness
m4 = 4.2;  // screw diameter
m3 = 3.2;  // screw diameter

module pscover(supports=true, tamiya=false){
  difference(){
    union(){
      // man cover walls
      cube([psw,wall,psh]);
      cube([psw,exd,wall]);     
      translate([psa,0,psh-wall])cube([psw-2*psa,psd+exd,wall]);     

      // side walls
      for(x=[0,psw-wall])translate([x,0,0])cube([wall,exd,psh]);
      for(x=[psa,psw-wall-psa-1])translate([x,0,psb])cube([wall+1,exd+11.0,psh-psb]);
      for(x=[psa,psw-wall-psa-1])translate([x,0,psh-psb])cube([wall+1,exd+psd,psb]);

      // ac socket screw hubs
      translate([psw-wall-act/2,0,psh-1.5*wall-ach/2])
      for(x=[-acs/2,acs/2])translate([x,0,0])rotate(-90,[1,0,0])cylinder(r=5, wall+2);

      if(!tamiya){
         // molex frames
         for(n=[0:mon-1]){
         translate([2*wall+mox-wall+n*(wall+mow),0,psh-4*wall-ach/2-moh/2])cube([mow+2*wall,mod,moh+2*wall]);
         //%color("blue")translate([2*wall+mox-wall+n*(wall+mow)+mow/2+1.5+3.5,mod+6+(n==0?16:0),psh-4*wall-ach/2-6])rotate([90,0,-90])clip();
         }
      }else{
         // tamiya frames
         for(n=[0:tyn-1]){
         translate([2.5*wall+tyx-wall+n*(wall/2+tyw),0,psh-4*wall-ach/2-tyh/2])cube([tyw+2*wall,tyd,tyh+2*wall]);
         }
      }

      // lcd display support and voltage trimpot support
      for(x=[0,vds,2*vds-vdw+7])
         translate([x+vdx-vdw/2-(vds-vdw),0,psh-vdd])cube([vds-vdw,(exd+psd)/2+vdh/2,vdd]);
      
    }
    if(!tamiya){
      // molex cutouts
      for(n=[0:mon-1]){
        translate([2*wall+mox+n*(wall+mow),-1,psh-3*wall-ach/2-moh/2])cube([mow,mod+2,moh]);
        translate([2*wall+mox+n*(wall+mow)+mow/3,-1,psh-3*wall-ach/2+moh/2-1])cube([mow/3,mod+2,moc+1]);
        translate([2*wall+mox+n*(wall+mow)+mow/2-2,2*wall,psh-3*wall-ach/2-moh/2-1.5])cube([4,mod+2,moh+3]);
        translate([2*wall+mox+n*(wall+mow)+mow/2-2,2*wall,psh-3*wall-ach/2-moh/2-5])cube([4,5,moh+10]);
        translate([2*wall+mox+n*(wall+mow)+mow/2-2,2*wall+10,psh-3*wall-ach/2-moh/2-5])cube([4,5,moh+10]);
      } 
    }else{
      // tamiya cutouts
      for(n=[0:tyn-1]){
        translate([2.5*wall+tyx+n*(wall/2+tyw),-1,psh-3*wall-ach/2-tyh/2])cube([tyw,tyd+2,tyh]);
        translate([2.5*wall+tyx+n*(wall/2+tyw)+tyw/3,-1,psh-3*wall-ach/2+tyh/2-1])cube([tyw/3,tyd+2,tyc+1]);
        translate([2.5*wall+tyx+n*(wall/2+tyw)+tyw/2-2,2*wall,psh-3*wall-ach/2-tyh/2-1.5])cube([4,tyd+2,tyh+3]);
        translate([2.5*wall+tyx+n*(wall/2+tyw)+tyw/2-2,2*wall,psh-3*wall-ach/2-tyh/2-5])cube([4,5,tyh+10]);
        translate([2.5*wall+tyx+n*(wall/2+tyw)+tyw/2-2,2*wall+10,psh-3*wall-ach/2-tyh/2-5])cube([4,5,tyh+10]);
      } 
      // holes for Tamiya clamp
      translate([3.0*wall+tyx-3*wall-1,tyd+tyD/2,psh-4*wall-ach/2-tyh/2-3])
          rotate([0,90,0])cylinder(r=m3/2,h=4*wall);
      translate([3.0*wall+tyx-3*wall-1,tyd+tyD/2,psh-2*wall-ach/2+tyh/2+3])
          rotate([0,90,0])cylinder(r=m3/2,h=4*wall);
      translate([3.5*wall+tyx-wall+tyn*(wall/2+tyw)+3,-wall-1,psh-2*wall-tyh/2-ach/2])
          rotate([-90,0,0])cylinder(r=m3/2,h=3*wall);
    }
      // ac socket cutout
      translate([psw-wall-act/2,0,psh-1.5*wall-ach/2]){
         for(x=[-acs/2,acs/2])translate([x,-1,0])rotate(-90,[1,0,0])cylinder(r=m3/2, wall+2);
         for(x=[-acs/2,acs/2])translate([x,wall,0])rotate(-90,[1,0,0])cylinder(r=5.5/2/cos(30), wall+2,$fn=6);
	 hull(){
	   translate([-acw/2,-1,-ach/2])cube([acw,wall+2,ach-acc/sqrt(2)]);
	   translate([-acw/2+acc/sqrt(2),-1,+ach/2-0.1])cube([acw-sqrt(2)*acc,wall+2,0.1]);
	 }
      }

      // lcd display cutout
      translate([vdx-vdw/2,(exd+psd)/2-vdh/2,psh-wall-1])cube([vdw,vdh,wall+2]);

      // trimpot cutout
      translate([vds+vdx-vdw/2+3.5,(exd+psd)/2,psh-wall-1])cylinder(r=3.5,h=wall+2);
      translate([vds+vdx-vdw/2,(exd+psd)/2-5,psh-wall-1])cube([7,10,wall]);

      // ac switch cutout
      translate([psw/2,(exd+psd)/2-swh/2,psh-wall-1])cube([sww,swh,wall+2]);
      hull(){
          translate([psw/2-2,(exd+psd)/2-swh/2-2,psh-wall-0.1])cube([sww+4,swh+4,0.2]);
          translate([psw/2-1,(exd+psd)/2-swh/2-1,psh-wall/2])cube([sww+2,swh+2,0.1]);
      }

      // cutout for screws
      translate([psw/2,exd+6.5,psh/2])for(s=[-1,1])scale([s,1,1])translate([psw/2-wall-psa-1,0,0])rotate(90,[0,1,0])cylinder(r=m3/2,h=wall+psa+2);
      translate([psw/2,exd+6.5,psh/2])for(s=[-1,1])scale([s,1,1])translate([psw/2-wall-psa-2,0,0])rotate(90,[0,1,0])cylinder(r=5.5/2/cos(30),h=psa+1,$fn=6);

      // air flow grid
      for(z = [wall/2:6:15])translate([2*wall,-1,wall+z])cube([psw-4*wall,1+wall/2,3]);
      for(x = [2*wall+0.3:6:psw-2*wall])translate([x,wall/2-0.01,wall])cube([3,1+wall/2,18]);

      //  anti-warping grooves
      for(x = [8:20:psw-5]) translate([x,wall,wall/2])cube([1.5,exd-wall-2,wall]);
      for(x = [8,52,85,105]) translate([x,wall,psh-wall-1])cube([1.5,exd+psd-wall-2,wall/2+1]);
      //for(x = [18:20:psw-5]) translate([x,wall/2,psh/2])cube([1.5,wall/2+1,psh/2-wall]);
  }

  //  explicit bridge support for lcd display cutout (cut away after printing)
  if(supports)color("red")for(x=[vdw/3-1,2*vdw/3-1])
         translate([x+vdx-vdw/2,(exd+psd)/2-vdh/2,psh-wall])cube([2,vdh-0.25,wall]);

  // anti-warping disks

  if(supports && 0)color("red")for(x=[0,psw])for(z=[0,psh])translate([x,0.01,z])rotate(-90,[1,0,0])cylinder(r=7.5,h=0.5);

  // anti-warp shell
  if(supports && 0) color("red")difference(){
  translate([-2.56,0,-2.56])cube([psw+5.12,16,psh+5.12]);
  translate([-2,-1,-2])cube([psw+4,18,psh+4]);
  }

  %if(tamiya)tamiya_frame();
}

// frame to secure tamiya connectors in their cut-outs
module tamiya_frame(tyn=tyn){
   translate([0,tyd,0])difference(){
     union(){
       for(n=[0:tyn-1])
         translate([3.0*wall+tyx-wall+n*(wall/2+tyw),0,psh-4*wall-ach/2-tyh/2])
	     cube([tyw+wall,tyD,tyh+2*wall]);
       translate([3.0*wall+tyx-wall,0,psh-4*wall-ach/2-tyh/2-6])
          cube([wall/2,tyD,tyh+2*wall+12]);
       translate([3.0*wall+tyx-wall+tyn*(wall/2+tyw),0,psh-4*wall-ach/2-tyh/2])
          cube([6+wall/2,wall/2,tyh+2*wall]);
     }
     for(n=[0:tyn-1]){
        translate([2.5*wall+tyx+n*(wall/2+tyw),-1,psh-3*wall-ach/2-tyh/2])cube([tyw,tyD+2,tyh]);
        //translate([2.5*wall+tyx+n*(wall/2+tyw),tyD-tyb,psh-3*wall-ach/2-tyH/2])cube([tyw,tyb+1,tyH]);
        translate([2.5*wall+tyx+n*(wall/2+tyw),-1,psh-3*wall-ach/2-tyH/2])cube([tyw,tyb+1,tyH]);
      } 
      // holes for Tamiya clamp
      translate([3.0*wall+tyx-wall-1,tyD/2,psh-4*wall-ach/2-tyh/2-3])
          rotate([0,90,0])cylinder(r=m3/2,h=3*wall);
      translate([3.0*wall+tyx-wall-1,tyD/2,psh-2*wall-ach/2+tyh/2+3])
          rotate([0,90,0])cylinder(r=m3/2,h=3*wall);
      translate([3.5*wall+tyx-wall+tyn*(wall/2+tyw)+3,-wall-1,psh-2*wall-tyh/2-ach/2])
          rotate([-90,0,0])cylinder(r=m3/2,h=3*wall);
   }
}

//  clip tosecure the Molex connectors in their cut-outs
//
module clip(){
l = 10.2;  // length
w = 14.6;  // width
h = 3.5;   // height
d = 1.75;  // thickness
e = 2.2;   // width of hook
el = 3;    // length of hook
  difference(){
    cube([l+2*d+el,w+2*d,h]);
    translate([d,d,-0.01])cube([l,w,h+0.02]);
    translate([d+l-0.01,d+e,-0.01])cube([d+0.02,w-2*e,h+0.02]);
    hull(){
      translate([2*d+l-0.01,d+e,-0.01])cube([0.01,w-2*e,h+0.02]);
      translate([2*d+l+el,-0.01,-0.01])cube([0.01,w+2*d+0.02,h+0.02]);
    }
  }
}

  // blind inset for (unused) trimpot cutout
module cutout_cover(){
  //translate([psw-wall-act/2,0,psh-1.5*wall-ach/2])rotate([-90,0,0]){
  translate([+3.4,,0])cylinder(r=3.4,h=wall+2);
  translate([0,-4.9,0])cube([6.8,9.8,wall]);
  //}
}

//pscover(supports=false,tamiya=false);
//translate([-100,0,0])rotate(90)pscover(supports=false);
//translate([90,140,30])rotate(180)pscover(supports=false);

//translate([0,-50,0])color("blue")rotate(90,[1,0,0]) pscover();
rotate(90,[1,0,0]) pscover(supports=false,tamiya=true);
translate([0,50,-tyd]) rotate(90,[1,0,0]) tamiya_frame();

//cutout_cover();
// print clips without extra shells!
//clip();translate([0,21,0])clip();translate([19.5,29,0])rotate(180)clip();

