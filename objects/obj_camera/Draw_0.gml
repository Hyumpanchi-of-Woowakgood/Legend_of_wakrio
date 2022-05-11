/// @description Insert description here
// You can write your code in this editor
var c_scale = obj_camera.v_y/720
var c_x = camera_get_view_x(view_camera[0])
var c_y = camera_get_view_y(view_camera[0])
draw_text_kl_scale(c_x+32,c_y+32,instance_number(all),16,99999,1,c_white,0,1,font0,c_scale*0.25,c_scale*0.25,0)