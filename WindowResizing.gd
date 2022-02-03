extends Control

func _ready():
	# warning-ignore:return_value_discarded
	OS.min_window_size = Vector2(600, 450)
	get_tree().get_root().connect("size_changed", self, "window_resize")
	window_resize()

func window_resize():
	self.margin_right = get_viewport_rect().size.x
	self.margin_bottom = get_viewport_rect().size.y
