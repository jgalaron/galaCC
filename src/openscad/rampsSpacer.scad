// RAMPS board spacer
// By Julio Galaron (@jgalaron)
// cc by-sa 4.0 International

module body(size=20){
	hull(){
		translate([0,size/2,0])  rotate([0,0,0]) cylinder(h=7, r=9/2, $fn=26, center=true);
		translate([0,-size/2,0]) rotate([0,0,0]) cylinder(h=7, r=9/2, $fn=26, center=true);
	}
}

module holes(size=20){
	translate([0,size/2,0]){
		translate([0,0,0]) cylinder(h=8, r=3.5/2, $fn=26, center=true);
		translate([0,0,2]) cylinder(h=4.5, r=7/2, $fn=6, center=true);
	}

	translate([0,-size/2,0]){
		translate([0,0,0])  cylinder(h=8, r=3.5/2, $fn=26, center=true);
		translate([0,0,-2]) cylinder(h=4.5, r=6/2, $fn=26, center=true);
	}
}

//final part
difference(){
	body();
	holes();
}
