// Y axis ilder - 623zz bearing
// Based on Powercode Code_Yidler_623.stl design (https://github.com/Mecan0/Code)
// By Julio Galaron (@jgalaron)
// Licence Creative commons atribution & share alike.

translate([0,0,0])difference(){

	hull(){
		cube([1,22,16], center=true);
		translate([-27,0,0])      rotate([90,0,0]) cylinder(h=22, r=16/2, $fn=50, center=true);
		translate([-30.5,0,-7.5]) rotate([0,0,0])  cube([1,22,1], center=true);
	}

	//Nice edges
	rotate([0,0,90]) translate([0,14,0]) cylinder(h=25, r=12/2, $fn=4, center=true);

	//holes
	translate([-11,0,0]) cube([10,10,17], center=true);
	translate([-26,0,0]) cube([24,12,17], center=true);
	
	//back screw holes
	translate([-5,0,0]) rotate([90,0,90]) cylinder(h=2.6, r=6.7/2, center=true, $fn=6);
	rotate([90,0,90])   cylinder(h=30, r=3.2/2, center=true, $fn=26);

	//front screw holes
	translate([-27,0,-16])     rotate([90,0,90]){
		translate([0,16,0])    rotate([0,90,0]) cylinder(h=25, r=3.2/2, $fn=26, center=true);
		translate([-10,16,0])  rotate([0,90,0]) cylinder(h=2.1, r=6/2, $fn=26, center=true);
		translate([10.1,16,0]) rotate([90,0,0]) rotate([0,90,0]) cylinder(h=2.1, r=6.7/2, $fn=6, center=true);
	}
}