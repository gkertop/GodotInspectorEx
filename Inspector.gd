extends EditorInspectorPlugin

var SpriteScale = preload("SpriteScale.gd")
var AnimatedSpriteScale = preload("AnimatedSpriteScale.gd")


func can_handle(object):
	return true


func parse_property(object, type, path, hint, hint_text, usage):
	match object.get_class():
		"Sprite":
			if type == TYPE_VECTOR2 && path == "scale":
				add_property_editor_for_multiple_properties("Size", ["scale"], SpriteScale.new())
		"AnimatedSprite":
			if type == TYPE_VECTOR2 && path == "scale":
				add_property_editor_for_multiple_properties("Size", ["scale"], AnimatedSpriteScale.new())
	return false

