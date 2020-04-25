// 623/624 bearing belt guide
// Based on Josef Prusa vanilla x-end-idler design (https://github.com/josefprusa/Prusa3-vanilla) and PowerCode Code_Xend_Idler_A_M6 part (https://github.com/Mecan0/Code)
// By Julio Galaron (@jgalaron)
// GNU GPL v3

use <inc/x-endLeadScrew.scad>

module x_end_idler_base(){
	x_end_base();	
}

module x_end_idler_holes(){
	x_end_holes();
    translate([0,-23,30.25])     rotate([0,-90,0]) cylinder(h=80, r=1.8, $fn=30);
	translate([1.5,-23,30.25])   rotate([0,-90,0]) cylinder(h=10, r=3.1, $fn=30);
	translate([-21.5,-23,30.25]) rotate([0,-90,0]) rotate([0,0,30]) cylinder(h=80, r=3.6, $fn=6);
}

module idler(){

	translate([0,0,0])difference(){

	difference(){
		union(){
			intersection(){
				translate(v=[-1,70,0])
					#scale(.98) difference(){
						translate(v=[-5.5-10+1.5,-13.5,30]) cube([10,34,28], center=true);

						// Nice edges
						translate([-5.5-10+1.5,-10,30+23]) rotate([0,45,0])  cube([10,46,28], center=true);
						translate([-5.5-10+1.5,-10,30+23]) rotate([0,-45,0]) cube([10,46,28], center=true);
						translate([-5.5-10+1.5,-10,30-23]) rotate([0,45,0])  cube([10,46,28], center=true);
						translate([-5.5-10+1.5,-10,30-23]) rotate([0,-45,0]) cube([10,46,28], center=true);
					}
				}

				translate([-15,27,30]) rotate([90,0,180]) translate([0,0,13]) cylinder(r=5.5/2, h=6, $fn=26);
			}

			translate([-15,15,30])  rotate([90,0,180]) translate([0,0,13]) cylinder(r=3.2/2, h=20, $fn=26);
			translate([-15,44,30]) rotate([90,0,180]) rotate([0,0,30])    cylinder(h =2.4, r=6/2, $fn=6);

		}
	}

}

module screw(){
	union(){
		cylinder(r=3.2/2, h=40, $fn=26);
		translate([0,0,13]) cylinder(r=5.6/2, h=3, $fn=26);
	}
}


module x_end_idler(){
    translate([-20,-8,14]) cube([10,3,30]);
    
    mirror([0,1,0]) difference(){
       x_end_idler_base();
       x_end_idler_holes();
    }
}

 
*idler();

//Final part
difference(){
    x_end_idler();
    translate([-26.5,25,-1])    cube([20,20,70]);
    translate([-27,36,30])    rotate([90,0,90]) cylinder(h = 25, r=20, $fn=6);
    translate([-15,-23.6,30]) rotate([90,0,180]) screw();
}

