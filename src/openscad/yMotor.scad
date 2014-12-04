// Y axis Motor holder M3 screw
// Based on from Code_Ymotor.scad https://github.com/Mecan0/Code By J.Rodigo (www.jra.so)
// Licence Creative commons atribution & share alike.

hBase  = 10 ;	// Altura de la base

// Los dos taladros del soporte para el motor
dTaSo = 3.2 ;	// Diámetro del taladro
dTaCh = 6 ; 	// Diámetro del zócalo

module chamfer(a,h,g){ rotate( [0,0,g*90+45]) cube([a,a,h]); }
module vaciadoEx(){
	translate([3,-1,-1])    cube([32.2,6,hBase+2]);
	translate([-1,17.5,-1]) cube([2.7,34,hBase+2]);
}

// Vaciado interior
module vaciadoIn(){
	translate([34,19.5,-1])    cube([14,32,hBase+2]);
	translate([17.25,18,-1])   cube([18,34,hBase+2]);
	translate([17.7,22.97,-1]) cylinder(h=hBase+2, r=5, $fn=50);
	translate([12.7,23,-1])    cube([7,16,hBase+2]);
	translate([14.7,37,-1])    cube([7,14.5,hBase+2]);
}

// Chaflanes de la pieza en sentido anti-horario 
// empezando en por el del [0,0,0]
module chaflanes(){
	translate([0,5,-1])       chamfer(6,hBase+2,2);
	translate([37.2,0,-1])    chamfer(14,hBase+2,3);
	translate([46.7,17.5,-1]) chamfer(3,hBase+2,0);
	translate([35.2,18,-1])   chamfer(3,hBase+2,0);
	translate([12.7,39,-1])   chamfer(3,hBase+2,3);
	translate([12.7,51,-1])   chamfer(3,hBase+2,3);
	translate([1.7,47,-1])    chamfer(6,hBase+2,0);
	translate([1.7,17.5,-1])  chamfer(3,hBase+2,1);
}

// Taladro y zócalo para los tornillos de soporte del motor
module TMotor(){
	cylinder(h=hBase+2, r=dTaSo/2, $fn=100);

	translate([0,0,7.5])        cylinder(h=hBase-5.5, r=dTaCh/2, $fn=100);
	translate([0,-dTaCh/2,7.5]) cube([6,dTaCh,hBase-5.5]);
}

// Redondeo grande entre la sujeción y soporte
module redondeo(){
	difference(){
		translate([3,15,hBase]) cube([32.2,5,4]);
		translate([1,20.8,hBase+5.35]) rotate([0,90,0]) cylinder(h=35, r=6, $fn=100);	
	}
}

// Base de la pieza en el plano X-Y
module base(){
	difference(){
		union(){
			cube([46.7,51,hBase]);
			redondeo();
		}
		union(){
			vaciadoEx();
			vaciadoIn();
			chaflanes();

			translate([9.7,45,-1])  TMotor();
			translate([40.7,14,-1]) rotate([0,0,90]) TMotor();
		}
	}
}

// Bloque de sujeción en el plano X-Z
module sujecion(){
	hull(){

		translate([10,0,16])  rotate([-90,0,0]) cylinder(h=10, r=10, $fn=100);
		translate([22.2,0,16])rotate([-90,0,0]) cylinder(h=10, r=10, $fn=100);

		cube([32.2,10,1]);
	}
}

// Vaciado y taladro para el tornillo de sujeción
module TTornillo(){
	translate([11.3,8.5,16]) rotate([90,90,0])cylinder(h=6,r=6.7/2, $fn=6, center=true);
	translate([11.3,15,16])  rotate([90,0,0]) cylinder(r=3.2/2, h=20, $fn=26);
	translate([20.8,8.5,16]) rotate([90,90,0])cylinder(h=6, r=6.7/2, $fn=6, center=true);
	translate([20.8,15,16])  rotate([90,0,0]) cylinder(r=3.2/2, h=20, $fn=26);
}


// Unimos todos los bloques para crear la pieza
module pieza(){
	difference(){
		union(){
			base();
			translate([3,5,hBase-10]) sujecion();
		}
		translate([3,5,0]) TTornillo();
	}
}

pieza();
