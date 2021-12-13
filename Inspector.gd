extends EditorInspectorPlugin

var SpriteScale2Vector2Property = preload("SpriteScale2Vector2Property.gd")
var AnimatedSpriteScale2Vector2Property = preload("AnimatedSpriteScale2Vector2Property.gd")


func can_handle(object):
	return true


func parse_property(object, type, path, hint, hint_text, usage):
	match object.get_class():
		"Sprite":
			if type == TYPE_VECTOR2 && path == "scale":
				add_property_editor_for_multiple_properties("Size", ["scale"], SpriteScale2Vector2Property.new())
		"AnimatedSprite":
			if type == TYPE_VECTOR2 && path == "scale":
				add_property_editor_for_multiple_properties("Size", ["scale"], AnimatedSpriteScale2Vector2Property.new())
	return false

