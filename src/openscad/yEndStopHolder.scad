// Y axis endstop holder
// By Julio Galaron (@jgalaron)
// cc by-sa 4.0 International

module base(){ translate([-7,-11,19]) cube([14,7,26]); }

module rods(){	
	translate([-11,-11,0]){
		translate([11,0,20])  rotate([0,0,90])  rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 20, r=4.9, $fn=30);
		translate([11,-4,45]) rotate([0,90,90]) cylinder(h = 20, r=3.9, $fn=30); 
	}
}

module endStop(){
	translate([-.8,-12,26.5])  cube([1.5,6.55,12.85]);
	translate([-3.45,-10,26.5])cube([6.45,6.55,12.85]);
}

//final part
rotate([90,0,0]) difference(){
	base();
	rods();
	endStop();	
}
