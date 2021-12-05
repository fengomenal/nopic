// add ridge for stopper
module body() {
  difference() {
    scale([1, 1.4, 1]) cylinder($length, $case_rad, $case_rad, true);
    scale([1, 1.4, 1]) cylinder($length + 2, $case_rad - 1, $case_rad - 1, true);
  }
  translate([0, 0, -$length / 2 -3]) ridge();
}

module nib_port() {
  translate([0, 0, -3]) difference() {
    union() {
      scale([1, 1.4, 1]) cylinder(6, $nib_rad + 1, $case_rad - 1, true);
      translate([0, 0, -6]) cylinder(6, $nib_rad + 1, $nib_rad + 1, true);
    }
    union() {
      translate([0, 0, 2]) scale([1, 1.4, 1]) cylinder(8, $nib_rad + 1, $case_rad - 1, true);
      translate([0, 0, -6]) cylinder(10, $nib_rad, $nib_rad, true);
    }
  }
}

module ridge() {
  translate([0, 0, 1.5]) difference() {
    scale([1, 1.4, 1]) cylinder(3, $case_rad - .75, $case_rad - 1, true);
    scale([1, 1.4, 1]) cylinder(4, $case_rad - 2, $case_rad - 2, true);
  }
  translate([0, 0, -1.5]) difference() {
    scale([1, 1.4, 1]) cylinder(3, $case_rad - 1, $case_rad - .75, true);
    scale([1, 1.4, 1]) cylinder(4, $case_rad - 2, $case_rad - 2, true);
  }
}

module cap() {
  difference() {
    scale([1, 1.4, 1]) cylinder([5, $case_rad, $case_rad]);
  }
}


$fn = 60;
$length = 90;
$case_rad = 6;
$nib_rad = 1.5;
translate([0, 0, $length / 2 + 6]) body();
nib_port();