/// @description Insert description here
// You can write your code in this editor

if y > room_height
{
y -= 1000
}



if image_xscale = 0
{
image_xscale = 1
}

if running_cooltime > 0
{
running_cooltime --
}

if running_cooltime > 0
{
	if keyboard_check_pressed(vk_left) && keypress_run = vk_left
	{
	running = 1
	}
	
	if keyboard_check_pressed(vk_right) && keypress_run = vk_right
	{
	running = 1
	}
	
	if (keyboard_check_pressed(vk_left) && keypress_run = vk_right) || (keyboard_check_pressed(vk_right) && keypress_run = vk_left)
	{
	running = 0
	running_cooltime = 0
	}
}

if !keyboard_check(vk_left) && !keyboard_check(vk_right)
{
running = 0
}

if keyboard_check_pressed(vk_left)
{
running_cooltime = 23
keypress_run = vk_left
}

if keyboard_check_pressed(vk_right)
{
running_cooltime = 23
keypress_run = vk_right
}



if gravity = 0
{
	repeat(160)
	{
	var _a = 0
		for(var i = -16; i <= 16; i ++)
		{
			if position_meeting(x+i,y+26,floor_parents)
			{
			_a = 1
			break;
			}
		}
		
		if position_meeting(x,y+26+vspeed,floor_parents)
		{
		vspeed += (0 - vspeed)*0.54
		}
		
		
		if _a = 1
		{
		y -= 0.1
		}
		else
		{
		jump = 0
		break;
		}
	}
}


//공중에 떠있는지 체크
var _flying = 0
for(var i = -16; i <= 16; i++)
{
	if position_meeting(x+i,y+27,floor_parents)
	{
	_flying = 1
	}
}

//블럭에 머리 박았는지 체크
var _head_check = 0
for(var i = -16; i <= 16; i++)
{
	if position_meeting(x+i,y-27,floor_parents)
	{
	_head_check = 1
	}
}

if _head_check = 1
{
gravity = 0.2
	if vspeed < 0
	{
	vspeed = abs(vspeed)*0.5
	}
}


if !_flying
{
	if clime = 0 && cannot_move = 0
	{
	sprite_index = jump_sprite
	}
gravity = 0.25
}
else
{
gravity = 0
vspeed = 0
	if hurt = 0 && spin = 0 && cannot_move = 0
	{
	sprite_index = move_sprite
	}
}



if cannot_move = 0
{
	if keyboard_check_pressed(vk_down) && spin = 0 && _flying
	{
	spin = 1
	cannot_move = 1
	var sfx = audio_play_sound(jump_sfx,0,0)
	audio_sound_gain(sfx,0.4*global.sfx_volume*global.master_volume,0)
	sprite_index = spin_sprite
	}
}

if spin > 0
{
sprite_index = spin_sprite
spin += 0.3
image_index = spin

global.movement_speed = -(12-spin)*sign(image_xscale)

	if !_flying
	{
	alarm[3] = 13-spin
	}

	if spin >= 12
	{
	spin = 0
	cannot_move = 0
	sprite_index = move_sprite
	image_index = 0
	}
}



if spin = 0 && cannot_move = 0
{
	if keyboard_check(vk_left)
	{
		if clime = 0
		{
		image_xscale = abs(image_xscale)
		}
	
	global.movement_speed += (-4 - global.movement_speed)*0.055
	global.movement_speed -= 0.1
	}
	else if keyboard_check(vk_right)
	{
		if clime = 0
		{
		image_xscale = -abs(image_xscale)
		}
	
	global.movement_speed += (4 - global.movement_speed)*0.055
	global.movement_speed += 0.1
	}
	else
	{
		if sprite_index = jump_sprite
		{
		global.movement_speed += (0 - global.movement_speed)*0.01
		}
		else
		{
		global.movement_speed += (0 - global.movement_speed)*0.15
		}
	}
}


if jump_cooltime > 0
{
jump_cooltime ++
	if jump_cooltime > 30
	{
	jump_cooltime = 0
	}
}




if keyboard_check(vk_space) && spin = 0 && cannot_move = 0
{
	if _flying && jump_cooltime = 0
	{
	var sfx = audio_play_sound(jump_sfx,0,0)
	audio_sound_gain(sfx,0.4*global.sfx_volume*global.master_volume,0)
	vspeed = -7
	jump_cooltime = 1
	jump = 1
	}
	
	if sprite_index = clime_sprite
	{
		if sign(image_xscale) = 1 && keyboard_check(vk_left)
		{
		var sfx = audio_play_sound(jump_sfx,0,0)
		audio_sound_gain(sfx,0.4*global.sfx_volume*global.master_volume,0)
		global.movement_speed -= 7
		vspeed = -6
		}
		
		if sign(image_xscale) = -1 && keyboard_check(vk_right)
		{
		var sfx = audio_play_sound(jump_sfx,0,0)
		audio_sound_gain(sfx,0.4*global.sfx_volume*global.master_volume,0)
		global.movement_speed += 7
		vspeed = -6
		}
	}
}


if position_meeting(x+global.movement_speed+16,y,floor_parents_clime) || position_meeting(x+global.movement_speed-16,y,floor_parents_clime)
{
	if !_flying
	{
		if clime = 0
		{
		var sfx = audio_play_sound(footstep_sfx,0,0)
		audio_sound_gain(sfx,0.15*global.sfx_volume*global.master_volume,0)
		clime = 1
			if vspeed > 0
			{
			vspeed = 0
			}
			
			if vspeed < 0
			{
			vspeed *= 0.5
			}
		}
	image_xscale = sign(global.movement_speed)
	}
	
	if _flying
	{
	clime = 0
	}

repeat(999)
{
	if !position_meeting(x+17,y,floor_parents_clime) && !position_meeting(x-17,y,floor_parents_clime)
	{
	x += sign(global.movement_speed)*0.1
	}
	else
	{
	break;
	}
}
global.movement_speed = 0
}
else
{
	if !position_meeting(x+global.movement_speed+(sign(global.movement_speed)*16),y,floor_parents)
	{
	x += global.movement_speed*0.9
	}
	else
	{
	global.movement_speed += (0 - global.movement_speed)*0.1
		if global.movement_speed < 0.1
		{
		global.movement_speed = 0
		}
	}
}

if !position_meeting(x+18,y,floor_parents) && !position_meeting(x-18,y,floor_parents)
{
clime = 0
}


if clime = 1
{
sprite_index = clime_sprite
}

if cannot_move = 0
{
image_index += global.movement_speed*0.11
	if abs(global.movement_speed) < 0.3
	{
	image_index = 0
	}
}

if floor(image_index) = 3 || floor(image_index) = 9
{
	if al_footstep_sound = 0
	{
	var sfx = audio_play_sound(footstep_sfx,0,0)
	audio_sound_gain(sfx,0.15*global.sfx_volume*global.master_volume,0)
	al_footstep_sound = 1
	}
}
else
{
al_footstep_sound = 0
}