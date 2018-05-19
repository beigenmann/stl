difference() {
rotate(a=[0,0,45]) {
import("yoda.stl", convexity = 5);
}
translate([14,0,4]) rotate(a=[90,0,90]) {
scale([0.09, 0.1, 0.01])
  surface(file = "yedi.png", center = true);
}
}