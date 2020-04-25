// X carriage 30mm spacing
// Based on Josef Prusa vanilla x-end-motor design (https://github.com/josefprusa/Prusa3-vanilla)
// By Julio Galaron (@jgalaron)
// GNU GPL v3

use <inc/x-endLeadScrew.scad>

module x_end_motor_base(){
	difference(){
		translate([-6.5,10.5,48]) cube([5.5,5,10]);
        translate([-.5,-35.5,17]) rotate([-45,0,0])translate([-6.5,10.5,48])cube([6.5,6,20]);
		translate([-3.8,12.7,30]) cylinder(h = 70, r=2.5/2, $fn=30);
	}

    x_end_base();
    translate(v=[-15,31,26.5]) cube(size = [17,44,53], center = true);
}

module x_end_motor_holes(){

    x_end_holes();
 
    translate(v=[-1,32,30.25]){

        // Belt hole
        translate(v=[-14,-1,0]) cube(size = [10,46,22], center = true);
        
        // Motor mounting holes
        translate(v=[20,-15.5,-15.5]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
        translate(v=[1,-15.5,-15.5])  rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);
     
        translate(v=[20,-15.5,15.5])  rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
        translate(v=[1,-15.5,15.5])   rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);

        translate(v=[20,15.5,-15.5])  rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
        translate(v=[1,15.5,-15.5])   rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);

        translate(v=[20,15.5,15.5])   rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=1.8, $fn=30);
        translate(v=[1,15.5,15.5])    rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 10, r=3.1, $fn=30);

        //Material saving cutout 
        translate(v=[-10,12,10]) cube(size = [60,42,42], center = true);

        //Material saving cutout
        translate(v=[-10,40,-30]) rotate(a=[45,0,0])  cube(size = [60,42,42], center = true);

        //Motor shaft cutout
        translate(v=[0,0,0]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=17, $fn=6);
    }

    translate([25,28,3]) rotate(a=[0,-90,0]) rotate(a=[0,0,90]) cylinder(h = 70, r=2.8/2, $fn=30);
}

module x_end_motor(){
    difference(){
        x_end_motor_base();
        x_end_motor_holes();
    }
}

//final part
x_end_motor();
