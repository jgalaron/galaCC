// X carriage 30mm spacing self locking
// Based on Josef Prusa vanilla x-carriage design (https://github.com/josefprusa/Prusa3-vanilla)
// By Julio Galaron (@jgalaron)
// GNU GPL v3

use <inc/bearing.scad>
x_rod_distance = 45;

module x_carriage_base(){
    
    //Small bearing holder
    intersection(){
		translate([-30.5,-11.5,0]) cube([28,68,7+1.5]);
        translate([-33/2,+2,0])   rotate([0,0,90]) horizontal_bearing_base(1);
    }

	hull(){ 
		translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_base(2);
        translate([-36,20,0]) cube([39,16,15]);
    }

    //Base plate
   	difference(){
    	translate([-30.5,-11.5,0]) cube([28,68,7+1.5]);
   		translate([-39,9,6]) cube([50,25,15]);
    }
}

module x_carriage_beltcut(){

	union(){
		translate([-10,30.32,6]) cube([18,2,15]);

		hull(){
			translate([-10,30.32,6]) cube([7,2,15]);
			translate([-10,27.5,6])  cylinder(r=10/2, h=20, $fn=100);
		}
	}

	translate([-13,0,0])union(){
		translate([-28,30.32,6]) cube([18,2,15]);

		hull(){
			translate([-17,30.32,6]) cube([7,2,15]);
			translate([-10,27.5,6])  cylinder(r=10/2, h=20, $fn=100);
		}
	}
}

module x_carriage_holes(){
    //Small bearing holder holes cutter
    translate([-33/2,2,0]) rotate([0,0,90]) horizontal_bearing_holes(1);

    //Long bearing holder holes cutter
    translate([-33/2,x_rod_distance+2,0]) rotate([0,0,90]) horizontal_bearing_holes(2);

    //Extruder mounting holes
    translate([-16.5+15,24,-1])cylinder(r=1.7, h=20, $fn=32);
    translate([-16.5+15,24,10])cylinder(r=3.3, h=20, $fn=6); 
    translate([-16.5-15,24,-1])cylinder(r=1.7, h=20, $fn=32);
    translate([-16.5-15,24,10])cylinder(r=3.3, h=20, $fn=6);    
}

module x_carriage_belt_guide(){
	translate([-10,27.5,6])  {
		hull(){
			cylinder(r=5/2, h=9, $fn=100); 
			translate([3,2,0])cylinder(r=1/2, h=9, $fn=100); 
		}
	}
	translate([-22.7,27.5,6]){
		hull(){
			cylinder(r=5/2, h=9, $fn=100); 
			translate([-3,2,0])cylinder(r=1/2, h=9, $fn=100); 
		}
	}
}

module x_carriage_fancy(){
    //Top left corner
    translate([-48,-5,0])    translate([0,45+11.5,-1]) rotate([0,0,135]) translate([0,-15,0]) cube([30,30,20]);  
    translate([-54,45.5,-1]) rotate([0,0,-135]) cube(20);
    translate([-46,17.5,-1]) cube([10,15,20]);

    translate([-73,32,-1]) cube([30,30,20]);

    //Top right corner
    translate([15,-5,0])    translate([0,45+11.5,-1]) rotate([0,0,45]) translate([0,-15,0]) cube([30,30,20]);
    translate([35.5,32,-1]) rotate([0,0,135]) cube(20);  
    translate([10,32,-1])   cube([30,30,20]);
    translate([3,17.5,-1])  cube([10,15,20]);

    //Bottom ĺeft corner
    translate([-33,5,0]) translate([0,-11.5,-1]) rotate([0,0,-135]) translate([0,-15,0]) cube([30,30,20]);
    translate([-38.5,25,-1]) rotate([0,0,-135]) cube([10,10,20]);

    //Bottom right corner
    translate([0,5,0]) translate([0,-11.5,-1]) rotate([0,0,-45]) translate([0,-15,0]) cube([30,30,20]);
    translate([6.5,26,-1]) rotate([0,0,-135]) cube([10,10,20]);

}

module x_carriage(){
    x_carriage_belt_guide();

    difference(){
        x_carriage_base();
        x_carriage_beltcut();
        x_carriage_holes();
        x_carriage_fancy();
    }           
}

//Final part
x_carriage();
