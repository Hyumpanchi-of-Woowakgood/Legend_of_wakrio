/// @description Insert description here
// You can write your code in this editor
global.ele_m_speed += (global.t_ele_m_speed - global.ele_m_speed)*0.01;

if global.wave_start > 0
{
global.t_ele_m_speed = 2;

	if global.ele_m_speed < 2.1
	{
	instance_create_depth(-100,-100,0,draw_wave);
	global.wave ++;
	global.wave_start = 0;
	alarm[0] = 60;
	};
};