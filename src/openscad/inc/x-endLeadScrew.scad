// PRUSA iteration3
// X end prototype
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <bearing.scad>

rod_distance = 45;


module x_end_base(){
	//Main block
	height = 58;
	translate(v=[-15,-9,height/2]) cube(size = [17,39,height], center = true);
	
	//Bearing holder
 	vertical_bearing_base();	
	
    translate(v=[-6,-10.6,10]) rotate([0,0,48.2]) cube(size = [10,5,1], center = true);
	//Nut trap
 	translate(v=[0,-17,0]) cylinder(h = 8, r=23.5/2, $fn=100);
}

module x_end_holes(){
    vertical_bearing_holes();
    
    //Belt hole
    translate(v=[-1,0,0]) difference(){
	   translate(v=[-5.5-10+1.5,-15,30]) cube(size = [10,46,28], center = true);
    	// Nice edges
    	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,45,0]) cube(size = [10,46,28], center = true);
    	translate(v=[-5.5-10+1.5,-10,30+23]) rotate([0,-45,0]) cube(size = [10,46,28], center = true);
    	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,45,0]) cube(size = [10,46,28], center = true);
    	translate(v=[-5.5-10+1.5,-10,30-23]) rotate([0,-45,0]) cube(size = [10,46,28], center = true);

    }

    //Bottom pushfit rod
    translate(v=[-15,-41.5,6]) rotate(a=[-90,0,0]) pushfit_rod(8.1,50);

    //Top pushfit rod
    translate(v=[-15,-41.5,rod_distance+6]) rotate(a=[-90,0,0]) pushfit_rod(8.1,50);
    
    //Nut trap
    
    // Hole for the nut
    translate(v=[0,-17, -1]) cylinder(h = 9.01, r = 10/2+0.2, $fn = 50);
    
    // Screw holes for TR nut
    translate(v=[0,-17, 0]) rotate([0, 0, -135]) translate([0, 8, -1]) cylinder(h = 10, r = 1.8, $fn=25);
    translate(v=[0,-17, 0]) rotate([0, 0, -135]) translate([0, -8, -1]) cylinder(h = 10, r = 1.8, $fn=25);
    
    
    translate(v=[0,-17, 0]) rotate([0, 0, -135]) translate([0, 8, 6]) rotate([0, 0, 0])cylinder(h = 3, r = 3.45, $fn=6);

    translate(v=[0,-17, 0]) rotate([0, 0, -135]) translate([0, -8, 6]) rotate([0, 0, 30])cylinder(h = 3, r = 3.2, $fn=6);
    translate([-5.5,-17.2,6]) rotate([0,0,30]) cube([5,5,3]);
    translate([-0,-17.2,6]) rotate([0,0,60]) cube([5,10,3]);
}

module pushfit_rod(diameter,length){
    cylinder(h = length, r=diameter/2, $fn=30);
    difference(){
        translate(v=[0,-diameter/2.85,length/2]) rotate([0,0,45]) cube(size = [diameter/2,diameter/2,length], center = true);
        translate(v=[0,-diameter/4-diameter/2-0.4,length/2]) rotate([0,0,0]) cube(size = [diameter,diameter/2,length], center = true);
    }
}

//Final part
module x_end_plain(){
    difference(){
        x_end_base();
        x_end_holes();
    }
}

x_end_plain();
