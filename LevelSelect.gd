extends Node2D

# Track how many beaten 1, 2 and 3 star levels
var sumOfBeatLevels = 0;
var sumOfTwoStarLevels = 0;
var sumOfThreeStarLevels = 0;

func _ready():
	$clickButton.play();

	# Hide the achievement popups
	get_node("oneStarGameWinImage").hide();
	get_node("twoStarGameWinImage").hide();
	get_node("threeStarGameWinImage").hide();
	
	HomeMenu.loadLevelStars(); # Load File
	
	var count = 1;
	for levels in HomeMenu.levelStars:
		# Color the buttons based on if the level has 1,2 or 3 stars or is not completed 
		if (levels == 1): 
			get_node("level" + str(count) + "Button").set("modulate", "red"); # Red = 1
		elif (levels == 2): 
			get_node("level" + str(count) + "Button").set("modulate", "yellow"); # Yellow = 2
		elif (levels == 3):
			get_node("level" + str(count) + "Button").set("modulate", "green"); # Green = 3
		else:
			get_node("level" + str(count) + "Button").set("modulate", "white"); # White = Unplayed
			
		# Tallies up the total number of 1, 2 and 3 star levels
		if (levels == 1):
			sumOfBeatLevels += 1;
		elif (levels == 2):
			sumOfBeatLevels += 1;
			sumOfTwoStarLevels += 1;
		elif (levels == 3):
			sumOfBeatLevels += 1;
			sumOfTwoStarLevels += 1;
			sumOfThreeStarLevels += 1;

		count+=1; # Increment the level counter
	
	# Checks for if user has met minimum requirements to beat the game
	if (sumOfThreeStarLevels == 25):
		get_node("threeStarGameWinImage").show();
		$victoryChime.play();
	elif (sumOfTwoStarLevels == 25):
		get_node("twoStarGameWinImage").show();
		$victoryChime.play();
	elif (sumOfBeatLevels == 25):
		get_node("oneStarGameWinImage").show();
		$victoryChime.play();

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/HomeMenu.tscn");
	
func _on_level_pressed(target):
	HomeMenu.level = target;
	get_tree().change_scene_to_file("res://Scenes/PlayLevel.tscn");

func _on_reset_progress_button_pressed():
	HomeMenu.levelStars = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	HomeMenu.saveLevelStars(); # Save File
	HomeMenu.loadLevelStars(); # Load File
	get_tree().change_scene_to_file("res://Scenes/HomeMenu.tscn");

