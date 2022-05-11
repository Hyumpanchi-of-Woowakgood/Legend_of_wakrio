/// @description Insert description here
// You can write your code in this editor
if global.never_move = 0 && keyboard_check_pressed(ord("A"))
{
	if global.got_wakchori > 0
	{
		if gravity = 0
		{
			if (attack_ < 7 && cannot_move = 0 && cooltime = 0 && hurt = 0)
			{
			attack_ = 1
			cooltime = 1
			cannot_move = 1
			if global.movement_speed*2 > 5
			{
			global.movement_speed = global.movement_speed*2
			}
			else
			{
			global.movement_speed = 5*sign(global.movement_speed)
			}

			vspeed += 2
			}
	
			if (attack_ < 7 && keep_attack = 0 && cannot_move != 0 && jump > 0 && cooltime = 0 && hurt = 0)
			{
			attack_ = 1
			cooltime = 1
			cannot_move = 1
			vspeed += 4
			if global.movement_speed*1.2 > 5
			{
			global.movement_speed = global.movement_speed*1.2
			}
			else
			{
			global.movement_speed = 5*sign(global.movement_speed)
			}
			}
	
	
			if attack_ > 0 && jump = 0
			{
			keep_attack = 1
			alarm[2] = 14
			}
		}
		else
		{
			if (cannot_move = 0 && cooltime = 0 && hurt = 0)
			{
			attack_in_air = 1
			cooltime = 1
			cannot_move = 1
			}
		}
	}
}

if attack_in_air > 0
{
sprite_index = attack_sprite_in_air
attack_in_air += 0.2
image_index = attack_in_air

	if attack_in_air > 3
	{
	attack_in_air += 0.11
	}

	if attack_sfx_on = 0 && attack_in_air > 4
	{
	var _ef = instance_create_depth(x,y,depth-1,effect_attack4)
	_ef.image_index = 3
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.8
	attack_sfx_on = 1
	var sfx = audio_play_sound(choose(swing_sfx2,swing_sfx1),0,0)
	audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)
	}

	if gravity = 0
	{
	attack_in_air = 12
	}
	
	if attack_in_air > 11
	{
	attack_in_air = 0
	attack_sfx_on = 0
	sprite_index = move_sprite
	alarm[1] = 12
	alarm[3] = 13
	}
}

if attack_ > 0
{
attack_ += 0.16

sprite_index = attack_sprite
image_index = attack_
cannot_move = 1
cooltime = 1
global.movement_speed += (0 - global.movement_speed)*0.1


if attack_sfx_on = 0 && (floor(image_index) = 2)
{
var sfx = audio_play_sound(swing_sfx1,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)

attack_sfx_on ++
	if !place_meeting(x-image_xscale*32,y,floor_parents)
	{
	global.movement_speed += (-image_xscale)*6.1
	}
	
	if hurt = 0 && global.playing_scene = 0
	{
	var _ef = instance_create_depth(x,y,depth-1,effect_attack1)
	_ef.image_index = 0
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.8
	}
}

if attack_sfx_on = 0 && (floor(image_index) = 6)
{
var sfx = audio_play_sound(swing_sfx2,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)
attack_sfx_on ++

	if !place_meeting(x-image_xscale*32,y,floor_parents)
	{
	global.movement_speed += (-image_xscale)*4.2
	}
	
	if hurt = 0
	{
	var _ef = instance_create_depth(x,y,depth-1,effect_attack2)
	_ef.image_index = 1
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.8
	}
}

if attack_sfx_on = 0 && (floor(image_index) = 11)
{
var sfx = audio_play_sound(swing_sfx3,0,0)
audio_sound_gain(sfx,0.4*global.master_volume*2*global.sfx_volume,0)
attack_sfx_on ++

	if !place_meeting(x-image_xscale*32,y,floor_parents)
	{
	global.movement_speed += (-image_xscale)*5.5
	}
	
	if hurt = 0
	{
	var _ef = instance_create_depth(x,y,depth-1,effect_attack3)
	_ef.image_index = 2
	_ef.image_xscale = image_xscale
	_ef.image_alpha = 0.8
	}
}

	if attack_ > 6.4 && attack_ < 7 && keep_attacking = 0
	{
		if keep_attack = 0
		{
		attack_ = 0
		keep_attack = 0
		keep_attacking = 0
		attack_sfx_on = 0
		sprite_index = move_sprite
		alarm[1] = 12
		alarm[3] = 13
		}
		else
		{
		keep_attacking ++
		attack_sfx_on = 0
		}
	}
	
	if attack_ > 9.4 && attack_ < 10 && keep_attacking = 1
	{
		if keep_attack = 0
		{
		attack_ = 0
		keep_attack = 0
		keep_attacking = 0
		attack_sfx_on = 0
		sprite_index = move_sprite
		alarm[1] = 12
		alarm[3] = 13
		}
		else
		{
		keep_attacking ++
		attack_sfx_on = 0
		}
	}
	
	if attack_ > 14.4 && keep_attacking = 2
	{
	attack_ = 0
	keep_attack = 0
	keep_attacking = 0
	attack_sfx_on = 0
	sprite_index = move_sprite
	alarm[1] = 12
	alarm[3] = 13
	}
}