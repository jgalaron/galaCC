// Z axis bottom holder
// Based on Josef Prusa vanilla z-axis-bottom design (https://github.com/josefprusa/Prusa3-vanilla)
// By Julio Galaron (@jgalaron)
// GNU GPL v3

module z_bottom_base(){
    translate([0,0,0])  cube([8,40,16+25]); // plate touching the base
    translate([0,-5,0]) cube([30,5.01,22]); // plate touching the base
    translate([0,-5,0]) cube([50,15,5]);    // plate touching the base
    translate([0,-5,0]) cube([18,50,5]);
}

module z_bottom_fancy(){
    //corner cutouts
    translate([0.5,-2.5,0])      rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51]);
    translate([0.5,40-0.5,0])    rotate([0,0,-45+90])  translate([-15,0,-1]) cube([30,30,51]);
    translate([-4+11,40+5+5,0])  rotate([0,0,-45-0])   translate([0,0,-1])   cube([30,30,51]);
    translate([8,0,12+20+6])     rotate([0,-90,0])     translate([0,-5,0])   cube([30,50,30]);
    translate([20,-2,12+8])      rotate([45,0,0])      rotate([0,-90,0])     translate([0,-5,0]) cube([30,50,30]);
    translate([8,20,12+30])      rotate([-45,0,0])     rotate([0,-90,0])     translate([0,-5,0]) cube([30,50,30]);
    translate([50-2.5,-5+2.5,0]) rotate([0,0,-45-90])  translate([-15,0,-1]) cube([30,30,51]);
    translate([50-1.5,10-1.5,0]) rotate([0,0,-45])     translate([-15,0,-1]) cube([30,30,51]);
    
    //Stiffner cut out
    translate([30,0,5.5]) rotate([0,-45,0]) translate([0,-5,0]) cube([30,50,30]);
}

module z_bottom_holes(endStopWireHole){
    //Frame mounting screw holes
    translate([-1,10,10+5])       rotate([0,90,0]) cylinder(h = 20, r=1.8, $fn=30);
    translate([-1,10+20,10+5])    rotate([0,90,0]) cylinder(h = 20, r=1.8, $fn=30);
    translate([-1,10+10,10+20+5]) rotate([0,90,0]) cylinder(h = 20, r=1.8, $fn=30);

    //Frame mounting screw head holes
    translate([4,10,10+5])           rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
    translate([4,10+20,10+5])        rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
    translate([4,10+10,10+20+5])     rotate([0,90,0]) cylinder(h = 20, r=3.1, $fn=30);
    translate([4,10+10-3.1,10+20+5]) cube([10,6.2,10]);

    //Z rod holder
    translate([25+4.3,4.2,-1])  rotate([0,0,0]) cylinder(h = 50, r=4.1, $fn=15);
    translate([25+4.3-1,3,0.6]) cube([2,10,7]); 

    //motor mounting
    translate([25+4.3,21,-1]){
        translate([15.5,-15.5,-1])  cylinder(h = 20, r=1.8, $fn=30);
        translate([-15.5,15.5,-1])  cylinder(h = 20, r=1.8, $fn=30);
        translate([-15.5,-15.5,-1]) cylinder(h = 20, r=1.8, $fn=30);
	   if(endStopWireHole == true) translate([-19.8,-19.5,-1]) cylinder(h = 20, r=3/2, $fn=30);
    }
}


module z_bottom_holder(){
    difference(){
        z_bottom_base();
        z_bottom_fancy();
        z_bottom_holes();
    }

    translate([0,-13,0]) mirror([0,1,0]) difference(){
        z_bottom_base();
        z_bottom_fancy();
        z_bottom_holes(endStopWireHole=true);
    }
}

//Final part
z_bottom_holder();
