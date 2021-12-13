extends EditorProperty

const UTILS = preload("Utils.gd")
var Utils = UTILS.new()

var VBox = VBoxContainer.new()
var XEdit = LineEdit.new()
var YEdit = LineEdit.new()

var XY = Vector2(0, 0)
var Updating = false


func _init():
	XEdit.text = "0"
	YEdit.text = "0"
	XEdit.connect("focus_exited", self, "_XEdit_focus_exited")
	XEdit.connect("text_entered", self, "_XEdit_text_entered")
	YEdit.connect("focus_exited", self, "_YEdit_focus_exited")
	YEdit.connect("text_entered", self, "_YEdit_text_entered")
	VBox.add_child(XEdit)
	VBox.add_child(YEdit)
	add_child(VBox)
	add_focusable(XEdit)
	add_focusable(YEdit)
	label = "Size"


func _XEdit_text_entered(value):
	_XEdit_focus_exited()


func _XEdit_focus_exited():
	var x = float(XEdit.text)
	if is_equal_approx(x, XY.x):
		return
	XY.x = x
	XEdit.text = str(Utils.stepify4(XY.x))
	emit_value()


func _YEdit_text_entered(value):
	_YEdit_focus_exited()


func _YEdit_focus_exited():
	var y = float(YEdit.text)
	if is_equal_approx(y, XY.y):
		return
	XY.y = y
	YEdit.text = str(Utils.stepify4(XY.y))
	emit_value()


func get_texture(object):
	return


func get_wh(object, texture):
	return


func emit_value():
	if Updating:
		return
	var object = get_edited_object()
	var texture = get_texture(object)
	if texture == null:
		return
	var wh = get_wh(object, texture)
	var new_value = Vector2(XY.x / wh.x, XY.y / wh.y)
	emit_changed("scale", new_value)


func update_property():
	var object = get_edited_object()
	var texture = get_texture(object)
	if texture == null:
		return
	var wh = get_wh(object, texture)
	var new_value = object[get_edited_property()] * wh
	if new_value == XY:
		return
	Updating = true
	XY = new_value
	XEdit.text = str(Utils.stepify4(XY.x))
	YEdit.text = str(Utils.stepify4(XY.y))
	Updating = false

