/// @description Insert description here
// You can write your code in this editor



	if global.t_shake_x <= 0.01
	{
	global.t_shake_x = 0
	}
	
	if global.t_shake_y <= 0.01
	{
	global.t_shake_y = 0
	}
global.t_shake_x += (0 - global.t_shake_x)*0.1
global.t_shake_y += (0 - global.t_shake_y)*0.1
global.real_shake_x += (global.t_shake_x*global.shake_x - global.real_shake_x)*0.1
global.real_shake_y += (global.t_shake_y*global.shake_y - global.real_shake_y)*0.1
global.shake_time ++
	if global.shake_time > 1
	{
	global.shake_x = -global.shake_x
	global.shake_y = -global.shake_y
	global.shake_time = 0
	}



x += global.real_shake_x
y += global.real_shake_y


depth = -9999

if instance_number(player) > 0
{
x += (player.x - x)*0.18
}

if t_x != -4
{
x += (t_x - x)*0.25
}


if instance_number(player) > 0
{
y += (player.y - y)*0.18
}

if t_y != -4
{
y += (t_y - y)*0.25
}

x = floor(x)
y = floor(y)


v_x += (tv_x - v_x)*0.02;
v_y += (tv_y - v_y)*0.02;
global.view_angle_ += (0 - global.view_angle_)*0.1

camera_set_view_angle(view_camera[0],global.view_angle_)
camera_set_view_size(view_camera[0],floor(v_x),floor(v_y));

