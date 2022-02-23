extends Node2D

var currencyValue = 0
var cost = 0
var canSpend = true
var items = []

func _ready():
	randomize()
	var display = randi()%3
	match display:
		0:
			$ItemsDisplay.position = Vector2(0,0)
			cost = round(rand_range(100, 160))
		1:
			$ItemsDisplay.position = Vector2(-500,0)
			cost = round(rand_range(200, 220))
		2:
			$ItemsDisplay.position = Vector2(500,0)
			cost = round(rand_range(180, 450))

func _itemsDisplay():
	if items.size() >= 1:
		match items[0]:
			"Defender":
				$ObtainedItems/FirstObj/AnimatedSprite.frame = 1
			"Repair":
				$ObtainedItems/FirstObj/AnimatedSprite.frame = 3
			"Booster":
				$ObtainedItems/FirstObj/AnimatedSprite.frame = 2
	else:
		$ObtainedItems/FirstObj/AnimatedSprite.frame = 0
	if items.size() >= 2:
		match items[1]:
			"Defender":
				$ObtainedItems/SecondObj/AnimatedSprite.frame = 1
			"Repair":
				$ObtainedItems/SecondObj/AnimatedSprite.frame = 3
			"Booster":
				$ObtainedItems/SecondObj/AnimatedSprite.frame = 2
	else:
		$ObtainedItems/SecondObj/AnimatedSprite.frame = 0
	if items.size() >= 3:
		match items[2]:
			"Defender":
				$ObtainedItems/ThirdObj/AnimatedSprite.frame = 1
			"Repair":
				$ObtainedItems/ThirdObj/AnimatedSprite.frame = 3
			"Booster":
				$ObtainedItems/ThirdObj/AnimatedSprite.frame = 2
	else:
		$ObtainedItems/ThirdObj/AnimatedSprite.frame = 0
	if items.size() >= 4:
		match items[3]:
			"Defender":
				$ObtainedItems/FourthObj/AnimatedSprite.frame = 1
			"Repair":
				$ObtainedItems/FourthObj/AnimatedSprite.frame = 3
			"Booster":
				$ObtainedItems/FourthObj/AnimatedSprite.frame = 2
	else:
		$ObtainedItems/FourthObj/AnimatedSprite.frame = 0
	if items.size() >= 5:
		match items[4]:
			"Defender":
				$ObtainedItems/FifthObj/AnimatedSprite.frame = 1
			"Repair":
				$ObtainedItems/FifthObj/AnimatedSprite.frame = 3
			"Booster":
				$ObtainedItems/FifthObj/AnimatedSprite.frame = 2
	else:
		$ObtainedItems/FifthObj/AnimatedSprite.frame = 0
	if items.size() >= 6:
		match items[5]:
			"Defender":
				$ObtainedItems/SixthObj/AnimatedSprite.frame = 1
			"Repair":
				$ObtainedItems/SixthObj/AnimatedSprite.frame = 3
			"Booster":
				$ObtainedItems/SixthObj/AnimatedSprite.frame = 2
	else:
		$ObtainedItems/SixthObj/AnimatedSprite.frame = 0
	if items.size() >= 7:
		canSpend = false

func _physics_process(_delta):
	$Buttons/Currency.text = "Currency: " + str(currencyValue)
	$Buttons/Cost.text = "Cost: " + str(cost)
	_itemsDisplay()

func _on_OptionsButton_pressed():
	self.get_parent().get_parent()._return()
	self.get_parent().get_parent().currencyValue = currencyValue
	self.get_parent().get_parent().items = items
	self.queue_free()


func _on_DefenderButton_pressed():
	if canSpend == true:
		if currencyValue >= cost:
			currencyValue -= cost
			$ItemsDisplay/Defender.queue_free()
			items.append("Defender")


func _on_BodyRepair_Button_pressed():
	if canSpend == true:
		if currencyValue >= cost:
			currencyValue -= cost
			$ItemsDisplay/Body_Repair.queue_free()
			items.append("Repair")


func _on_BoosterButton_pressed():
	if canSpend == true:
		if currencyValue >= cost:
			currencyValue -= cost
			$ItemsDisplay/Booster.queue_free()
			items.append("Booster")
