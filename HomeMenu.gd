extends Node2D

var savePath = "user://levelStars.save"; # Save pathway

# LevelSelect
var level = 0; # Current level selected
var levelStars = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; # Tracks how many stars per level 

# PlayLevel
var stars = 0; # Stars earned in a level

func _ready():
	$clickButton.play();

func saveLevelStars(): # Save File
	var file = FileAccess.open(savePath, FileAccess.WRITE) 
	file.store_var(levelStars);

func loadLevelStars(): # Load Save
	if FileAccess.file_exists(savePath):
		print("SAVE LOADED");
		var file = FileAccess.open(savePath, FileAccess.READ);
		levelStars = file.get_var();
	else:
		print("NEW SAVE");
		levelStars = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

func _on_play_button_pressed():
	loadLevelStars(); # Load Save
	get_tree().change_scene_to_file("res://Scenes/LevelSelect.tscn");
	
func _on_how_to_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/HowToPlay.tscn");

func _on_resources_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Resources.tscn");
