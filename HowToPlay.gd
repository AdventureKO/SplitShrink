extends Node2D

func _ready():
	$clickButton.play();

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/HomeMenu.tscn");
