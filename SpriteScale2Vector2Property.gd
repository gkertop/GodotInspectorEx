extends "Scale2Vector2Property.gd"


func get_texture(object):
	return object.texture


func get_wh(object, texture):
	var vec2 = Vector2(0, 0)
	if object.region_enabled:
		vec2 = object.region_rect.size
	else:
		vec2.x = texture.get_width()
		vec2.y = texture.get_height()
	if object.hframes > 1:
		vec2.x = vec2.x / object.hframes
	if object.vframes > 1:
		vec2.y = vec2.y / object.vframes
	return vec2

