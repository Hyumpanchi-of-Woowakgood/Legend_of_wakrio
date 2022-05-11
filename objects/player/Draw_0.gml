/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i < 256; i++)
{
	if place_meeting(x,y+i,floor_parents)
	{
	draw_sprite_ext(spr_shadow,0,x,y+27,1-abs(y-y+i)/48,1-abs(y-y+i)/64,0,c_white,(1-abs(y-y+i)/48)*0.3*image_alpha)
	break;
	}
}

draw_self()