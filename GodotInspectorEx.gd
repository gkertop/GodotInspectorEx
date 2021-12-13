tool
extends EditorPlugin

var Inspector


func _enter_tree():
	Inspector = preload("Inspector.gd").new()
	add_inspector_plugin(Inspector)


func _exit_tree():
	remove_inspector_plugin(Inspector)

