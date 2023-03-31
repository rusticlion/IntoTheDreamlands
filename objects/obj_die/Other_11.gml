/// @description drop callback: request accept on a slot
// You can write your code in this editor

slot = instance_place(x, y, obj_slot);
var acceptance = false;

if (slot != noone) {
	acceptance = slot.apply(self)
}

if (!acceptance) {
 // send die back to shelf	
}