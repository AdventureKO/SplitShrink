extends Node2D

# Display Variables
var mainValue = 999.0;
var divisorOne = 1;
var divisorTwo = 1;
var divisorThree = 1;
var divisorFour = 1;
var turnsLeft = 10;
var turnsTaken = 0;

# Other Variables
var startingTurns = 10;
var optimalSolution = 1;

func _ready():
	$clickButton.play();
	levelsToValues();
	updateDisplayValues();
	get_node("winLevelImage").hide(); 
	get_node("oneStarLevelWinImage").hide(); 
	get_node("twoStarLevelWinImage").hide(); 
	get_node("threeStarLevelWinImage").hide(); 
	get_node("failLevelImage").hide(); 
	get_node("turnsTakenLabel").hide(); 
	
	HomeMenu.loadLevelStars(); # Load File

# Sets up all variable components for the selected level
func levelsToValues():
	turnsLeft = 10;
	if (HomeMenu.level == 1):
		setValues(540, 2, 3, 4, 5, 10, 5);
		hideButtons(true, true, true, true, true, true);
	elif (HomeMenu.level == 2):
		setValues(251, 2, 5, 7, 10, 9, 4);
		hideButtons(false, true, true, false, true, true);
	elif (HomeMenu.level == 3):
		setValues(312, 4, 5, 7, 11, 9, 4);
		hideButtons(true, false, true, false, false, true);
	elif (HomeMenu.level == 4):
		setValues(4799, 2, 6, 18, 20, 10, 5);
		hideButtons(false, true, true, true, true, true);
	elif (HomeMenu.level == 5):
		setValues(976, 2, 6, 8, 9, 10, 5);
		hideButtons(true, true, false, true, true, false);
	elif (HomeMenu.level == 6):
		setValues(528, 4, 7, 8, 9, 10, 5);
		hideButtons(false, true, false, false, true, true);
	elif (HomeMenu.level == 7):
		setValues(456, 2, 3, 5, 9, 11, 6);
		hideButtons(false, true, false, true, false, false);
	elif (HomeMenu.level == 8):
		setValues(2432, 2, 8, 9, 11, 11, 6);
		hideButtons(true, true, false, false, true, true);
	elif (HomeMenu.level == 9) :
		setValues(2113, 2, 4, 7, 10, 11, 6);
		hideButtons(false, false, false, false, false, false);
	elif (HomeMenu.level == 10):
		setValues(2183, 3, 4, 5, 9, 12, 7);
		hideButtons(true, false, true, false, true, false);
	elif (HomeMenu.level == 11):
		setValues(7903, 3, 6, 7, 10, 12, 7);
		hideButtons(false, true, true, false, false, false);
	elif (HomeMenu.level == 12):
		setValues(782, 2, 3, 6, 9, 12, 7);
		hideButtons(false, true, false, true, false, true);
	elif (HomeMenu.level == 13):
		setValues(1234, 5, 6, 7, 8, 12, 7);
		hideButtons(false, false, false, false, true, false);
	elif (HomeMenu.level == 14):
		setValues(1758, 2, 3, 4, 9, 13, 8);
		hideButtons(false, true, true, false, false, false);
	elif (HomeMenu.level == 15):
		setValues(9762, 2, 3, 5, 8, 13, 8);
		hideButtons(true, true, false, true, false, false);
	elif (HomeMenu.level == 16):
			setValues(5622, 2, 3, 7, 9, 13, 8);
			hideButtons(false, false, false, false, false, false);
	elif (HomeMenu.level == 17):
		setValues(6834, 2, 5, 8, 12, 13, 8);
		hideButtons(false, false, false, false, false, false);
	elif (HomeMenu.level == 18):
		setValues(6529, 2, 3, 6, 7, 13, 8);
		hideButtons(false, false, true, false, false, false);
	elif (HomeMenu.level == 19):
		setValues(9873, 3, 5, 7, 9, 13, 8);
		hideButtons(false, true, false, false, false, false);
	elif (HomeMenu.level == 20):
		setValues(9942, 2, 3, 6, 7, 13, 8);
		hideButtons(false, false, true, false, false, false);
	elif (HomeMenu.level == 21):
		setValues(3867, 2, 3, 4, 7, 14, 9);
		hideButtons(false, false, false, false, false, false);
	elif (HomeMenu.level == 22):
		setValues(9377, 2, 4, 5, 10, 14, 9);
		hideButtons(false, false, false, false, true, false);
	elif (HomeMenu.level == 23):
		setValues(5676, 2, 3, 4, 5, 14, 9);
		hideButtons(false, true, false, false, true, false);
	elif (HomeMenu.level == 24):
		setValues(8713, 2, 3, 4, 9, 14, 9);
		hideButtons(true, false, false, false, false, false);
	elif (HomeMenu.level == 25):
		setValues(9001, 2, 3, 5, 13, 16, 11);
		hideButtons(false, false, false, true, false, false);
		
# Sets the puzzle numeric values by passing arguments
func setValues(main, dOne, dTwo, dThree, dFour, turns, opt):
	mainValue = main;
	divisorOne = dOne;
	divisorTwo = dTwo;
	divisorThree = dThree;
	divisorFour = dFour;
	turnsLeft = turns;
	startingTurns = turns;
	optimalSolution = opt;
		
# Hides/shows plus and minus buttons depending on arguments
func hideButtons(plusOne, plusTwo, plusThree, minusOne, minusTwo, minusThree):
	shouldShow("plusOneButton", plusOne);
	shouldShow("plusTwoButton", plusTwo);
	shouldShow("plusThreeButton", plusThree);
	shouldShow("minusOneButton", minusOne);
	shouldShow("minusTwoButton", minusTwo);
	shouldShow("minusThreeButton", minusThree);
	
# Simplifies conditional showing and hiding app components
func shouldShow(node, condition):
	if(condition):
		get_node(node).hide();
	else:
		get_node(node).show();

# Updates the text values of variables to be displayed on screen
func updateDisplayValues():
	get_node("mainValueLabel").text = str(mainValue);
	get_node("divisor1Label").text = str(divisorOne);
	get_node("divisor2Label").text = str(divisorTwo);
	get_node("divisor3Label").text = str(divisorThree);
	get_node("divisor4Label").text = str(divisorFour);
	get_node("turnsLeftLabel").text = str(turnsLeft);
	
	if (mainValue == 1.0): # Check if player won
		get_node("turnsLeftLabel").text = str(turnsLeft);
		turnsTaken = startingTurns - turnsLeft;
		calculateStars(optimalSolution)
		get_node("winLevelImage").show();
		if (HomeMenu.stars == 3):
			get_node("threeStarLevelWinImage").show();
		elif (HomeMenu.stars == 2):
			get_node("twoStarLevelWinImage").show();
		else:
			get_node("oneStarLevelWinImage").show();
		get_node("turnsTakenLabel").show();
		get_node("turnsTakenLabel").text = str(turnsTaken);
		$winLevel.play();
	elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
		get_node("turnsLeftLabel").set("modulate", "red");
		get_node("mainValueLabel").set("modulate", "red");
		get_node("failLevelImage").show();
	else:
		get_node("turnsTakenLabel").text = str(turnsTaken);
		get_node("turnsLeftLabel").set("modulate", "black");
		get_node("mainValueLabel").set("modulate", "black");

# Calculate how many stars player recieves depending on the turns they took compared to the optimal solution
func calculateStars(optimal):
	if (turnsTaken - optimal < 0): #player got better solution
		print("Level " + str(HomeMenu.level) + " has a new optimal solution of " + str(turnsTaken) + " turns!");
		HomeMenu.stars = 3;
	elif (turnsTaken - optimal == 0): #did optimal solution = 3 stars
		HomeMenu.stars = 3;
	elif (turnsTaken - optimal == 1 || turnsTaken - optimal == 2): #one or two turns off of optimal solution = 2 stars
		HomeMenu.stars = 2;
	else: #three + turns off of optimal solution = 1 star
		HomeMenu.stars = 1;
		
	if (HomeMenu.levelStars[HomeMenu.level-1] < HomeMenu.stars):
		HomeMenu.levelStars[HomeMenu.level-1] = HomeMenu.stars;
		HomeMenu.saveLevelStars(); # Save Game

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/LevelSelect.tscn");

func _on_restart_button_pressed():
	levelsToValues()
	updateDisplayValues()
	get_node("winLevelImage").hide(); 
	get_node("oneStarLevelWinImage").hide(); 
	get_node("twoStarLevelWinImage").hide();
	get_node("threeStarLevelWinImage").hide(); 
	get_node("failLevelImage").hide(); 
	get_node("turnsTakenLabel").hide();
	$clickButton.play();

func _on_divisor_button_1_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue / float(divisorOne);
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$divide.play();


func _on_divisor_button_2_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue / float(divisorTwo);
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$divide.play();


func _on_divisor_button_3_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue / float(divisorThree);
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$divide.play();


func _on_divisor_button_4_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue / float(divisorFour);
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$divide.play();


func _on_plus_one_button_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue + 1;
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		get_node("plusOneButton").hide();
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$plusAndMinus.play();
		



func _on_plus_two_button_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue + 2;
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		get_node("plusTwoButton").hide();
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$plusAndMinus.play();


func _on_plus_three_button_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue + 3;
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		get_node("plusThreeButton").hide();
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$plusAndMinus.play();


func _on_minus_one_button_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue - 1;
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		get_node("minusOneButton").hide();
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$plusAndMinus.play();


func _on_minus_two_button_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue - 2;
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		get_node("minusTwoButton").hide();
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$plusAndMinus.play();


func _on_minus_three_button_pressed():
	if (turnsLeft >= 1 && float(int(mainValue)) == mainValue && mainValue != 1.0 && mainValue > 1.0):
		mainValue = mainValue - 3;
		turnsLeft = turnsLeft - 1;
		updateDisplayValues()
		get_node("minusThreeButton").hide();
		if (mainValue == 1.0): # Check if player won
			$winLevel.play();
		elif (turnsLeft < 1 || float(int(mainValue)) != mainValue || mainValue < 1.0):
			$loseLevel.play();
		else:
			$plusAndMinus.play();
