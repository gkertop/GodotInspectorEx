extends "ScaleBase.gd"


func get_texture(object):
	var animation = object.animation
	if animation == "":
		return null
	var frames = object.frames
	if frames == null:
		return null
	return frames.get_frame(animation, 0)


func get_wh(object, texture):
	return Vector2(texture.get_width(), texture.get_height())

