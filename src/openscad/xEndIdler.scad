// X axis end idler M3 screw
// Based on Powercode Code_Xend_Idler_B_623_M6 design (https://github.com/Mecan0/Code)
// By Julio Galaron (@jgalaron)
// Licence Creative commons atribution & share alike.

xOffset = 0.1;
yOffset = 0.05;
zOffset = 0;

rotate([270,0,0]){

	difference(){
		union(){
			difference(){
				translate(v=[0,5,0]) cube(size=[9.7-xOffset,30-yOffset,27.5-zOffset], center=true);
	
				//Nice edges
				translate(v=[0,0,22.5])  rotate([0,45,0])  cube(size=[10,46,28], center=true);
				translate(v=[0,0,22.5])  rotate([0,-45,0]) cube(size=[10,46,28], center=true);
				translate(v=[0,0,-22.5]) rotate([0,45,0])  cube(size=[10,46,28], center=true);
				translate(v=[0,0,-22.5]) rotate([0,-45,0]) cube(size=[10,46,28], center=true);
			}
			
			difference(){
				translate([0,26,0]) rotate([90,0,90]) cylinder(h=17, r=16, $fn=6, center=true);
				translate([0,37,0]) cube([18,30,32], center=true);
			}
		}
		
		//holes	
		translate([0,-10,0]) rotate([90,0,0]) cylinder(h=10, r=2.5/2, $fn=26, center=true);
		translate([0,11,0])  rotate([0,90,0]) cube([12,30,10], center=true);

		hull(){ 
			translate([0,6,0])  rotate([0,90,0])cylinder(h=10, r=11/2, $fn=26,center=true);
			translate([0,17,0]) rotate([0,90,0])cylinder(h=10, r=20/2, $fn=26,center=true);
		}

		translate([0,20,0]) rotate([0,90,0]) cube([20,6,10], center=true);
		
		//screw holes
		translate([0,16,0]){
			translate([0,0,0])  rotate([0,90,0]) cylinder(h = 20, r=3.3/2, $fn=26, center=true);
			translate([8,0,0])  rotate([0,90,0]) cylinder(h = 2.1, r=6/2, $fn=26, center=true);
			translate([-8,0,0]) rotate([90,0,0]) rotate([0,90,0]) cylinder(h = 2, r=6.7/2, $fn=6, center=true);
		}
	}
}
