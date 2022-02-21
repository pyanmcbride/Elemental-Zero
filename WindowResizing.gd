extends Control

onready var animator= $"../MenuAnimations"
onready var credits = $CreditsScreen
onready var game = $GameScreen

func _ready():
	# warning-ignore:return_value_discarded
	OS.min_window_size = Vector2(600, 450)
	get_tree().get_root().connect("size_changed", self, "window_resize")
	window_resize()
	credits.hide()

func window_resize():
	self.margin_right = get_viewport_rect().size.x
	self.margin_bottom = get_viewport_rect().size.y

func _on_CreditsButton_pressed():
	credits.show()
	animator.play("CreditScreenFadeIn")

func _on_CreditsQuit_pressed():
	animator.play("CreditsScreenFadeOut")

func _on_LicenseBut_pressed():
	OS.shell_open("https://godotengine.org/license")

func _on_MenuAnimations_animation_finished(anim_name):
	if anim_name == "CreditsScreenFadeOut":
		credits.hide()

func _on_StartNewGame_pressed():
	game.show()
	animator.play("CreditScreenFadeIn")
