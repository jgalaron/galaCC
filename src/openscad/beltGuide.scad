// 623/624 bearing belt guide
// Based on Josef Prusa vanilla belt-guide design (https://github.com/josefprusa/Prusa3-vanilla)
// By Julio Galaron (@jgalaron)
// GNU GPL v3

wall      = 1.2;
clearence = 0;

module base(){
	union(){
    	cylinder(r=6, h=4.5, $fn=50);
	   	cylinder(r=6+2*wall, h=0.95, $fn=50);
	}
}

module holes(){
    translate([0,0,2])  cylinder(r=9.96/2+clearence, h=10, $fn=50); 
	translate([0,0,-1]) cylinder(r=5+wall+clearence-2*wall, h=10, $fn=50);
}

//final part
difference(){
	base();
	holes(); 
}