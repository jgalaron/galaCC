// Y belt holder self locking
// Based on Josef Prusa vanilla y-belt-holder design (https://github.com/josefprusa/Prusa3-vanilla)
// By Julio Galaron (@jgalaron)
// GNU GPL v3

module belt_holder_base(){
 	translate([-33-8.5,-1,0]) cube([33,15,11]); 
 	translate([-33-8.5,11,0]) cube([33,15,11]);
 	translate([-50,22,0]) cube([50,4,11]);	
}

module belt_holder_beltcut(){
	translate([-9,-22.4,-4])union(){
		translate([-10,30.42,6]) cube([18,2,15]);

		hull(){
			translate([-10,30.42,6]) cube([7,2,15]);
			translate([-10,27.5,6])cylinder(r=9/2, h=20, $fn=100);
		}
	}

	translate([-21,-22.3,-4])union(){
		translate([-28,30.32,6]) cube([18,2,15]);

		hull(){
			translate([-17,30.32,6]) cube([7,2,15]);
			translate([-10,27.5,6])cylinder(r=9/2, h=20, $fn=100);
		}
	}
}

module belt_holder_holes(){
	translate([-4.5,0,5.5])  rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
	translate([-45.5,0,5.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
}


module belt_holder(){
	difference(){
 		belt_holder_base();
  		belt_holder_beltcut();
  		belt_holder_holes();
 	}
	
	translate([-19,5,0]){
		hull(){
			cylinder(r=5/2, h=11, $fn=100); 
			translate([3,2,0]) cylinder(r=1/2, h=11, $fn=100); 
		}
	}
	translate([-31,5,0]){
		hull(){
			cylinder(r=5/2, h=11, $fn=100); 
			translate([-3,2,0]) cylinder(r=1/2, h=11, $fn=100); 
		}
	}
}

// Final part
belt_holder();
