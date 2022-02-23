extends Node2D

var adventure = preload("res://Scenes/Battle_Screen.tscn")
var shop = preload("res://Scenes/Shop.tscn")
var Recruit = preload("res://Scenes/Recruitment_Office.tscn")
var organize = preload("res://Scenes/Team_Organize.tscn")
var roomLvl = 0

var playerHealth = 100

var items = []

var currencyValue = 0
var summonPoints = 0

var supportCharacterA = null
var supportCharacterB = null
var supportCharacterC = null
var mainCharacter = "Ventusr_norm"

var EsupportCharacterA = null
var EsupportCharacterB = null
var EsupportCharacterC = null
var mainEnemyCharacter = null

var bounty = 0

var normVentusrLvl = 0
var normBrookeLvl = 0
var normTavaLvl = 0
var normYaooanLvl = 0
var normQueenLvl = 0
var normGuardLvl = 0


func _return():
	$Buttons/Recruiting_House.disabled = false
	$Buttons/Adventure.disabled = false
	$Buttons/Item_Shop.disabled = false
	$Buttons/Team_Organize.disabled = false
	$Buttons/OptionButton.disabled = false

func _on_Adventure_pressed():
	if mainCharacter != null:
		$Buttons/Recruiting_House.disabled = true
		$Buttons/Adventure.disabled = true
		$Buttons/Item_Shop.disabled = true
		$Buttons/Team_Organize.disabled = true
		$Buttons/OptionButton.disabled = true
		_allocateRooms()
		var k = adventure.instance()
		k.roomLvl = roomLvl
		k.supportCharacterA = supportCharacterA
		k.supportCharacterB = supportCharacterB
		k.supportCharacterC = supportCharacterC
		k.EsupportCharacterA = EsupportCharacterA
		k.EsupportCharacterB = EsupportCharacterB
		k.EsupportCharacterC = EsupportCharacterC
		k.mainCharacter = mainCharacter
		k.mainEnemyCharacter = mainEnemyCharacter
		k.items = items
		k.playerHealth = playerHealth
		k.normVentusrLvl = normVentusrLvl
		k.normBrookeLvl = normBrookeLvl
		k.normTavaLvl = normTavaLvl
		k.normYaooanLvl = normYaooanLvl
		k.normGuardLvl = normGuardLvl
		k.normQueenLvl = normQueenLvl
		$Arena.add_child(k)

func _bountyIncrease():
	currencyValue += bounty

func _allocateRooms():
	randomize()
	if roomLvl < 10 and roomLvl >= 0:
		bounty = round(rand_range(10,100))
		mainEnemyCharacter = "Brooke_norm"
		var chance = randi() %5
		var chance2 = randi() %5
		var chance3 = randi() %5
		match chance:
			0:
				EsupportCharacterA = null
			1:
				EsupportCharacterA = "Ventusr_norm"
			2:
				EsupportCharacterA = "Brooke_norm"
			3:
				EsupportCharacterA = "Tava_norm"
			4:
				EsupportCharacterA = "Yaooan_norm"
		match chance2:
			0:
				EsupportCharacterB = null
			1:
				EsupportCharacterB = "Ventusr_norm"
			2:
				EsupportCharacterB = "Brooke_norm"
			3:
				EsupportCharacterB = "Tava_norm"
			4:
				EsupportCharacterB = "Yaooan_norm"
		match chance3:
			0:
				EsupportCharacterC = null
			1:
				EsupportCharacterC = "Ventusr_norm"
			2:
				EsupportCharacterC = "Brooke_norm"
			3:
				EsupportCharacterC = "Tava_norm"
			4:
				EsupportCharacterC = "Yaooan_norm"
	if roomLvl < 15 and roomLvl >= 10:
		bounty = round(rand_range(20,120))
		mainEnemyCharacter = "Tava_norm"
		var chance = randi() %5
		var chance2 = randi() %5
		var chance3 = randi() %5
		match chance:
			0:
				EsupportCharacterA = null
			1:
				EsupportCharacterA = "Ventusr_norm"
			2:
				EsupportCharacterA = "Brooke_norm"
			3:
				EsupportCharacterA = "Tava_norm"
			4:
				EsupportCharacterA = "Yaooan_norm"
		match chance2:
			0:
				EsupportCharacterB = null
			1:
				EsupportCharacterB = "Ventusr_norm"
			2:
				EsupportCharacterB = "Brooke_norm"
			3:
				EsupportCharacterB = "Tava_norm"
			4:
				EsupportCharacterB = "Yaooan_norm"
		match chance3:
			0:
				EsupportCharacterC = null
			1:
				EsupportCharacterC = "Ventusr_norm"
			2:
				EsupportCharacterC = "Brooke_norm"
			3:
				EsupportCharacterC = "Tava_norm"
			4:
				EsupportCharacterC = "Yaooan_norm"
	if roomLvl < 20 and roomLvl >= 15:
		bounty = round(rand_range(50,140))
		mainEnemyCharacter = "Brooke_norm"
		var chance = randi() %5
		var chance2 = randi() %5
		var chance3 = randi() %5
		match chance:
			0:
				EsupportCharacterA = null
			1:
				EsupportCharacterA = "Ventusr_norm"
			2:
				EsupportCharacterA = "Brooke_norm"
			3:
				EsupportCharacterA = "Tava_norm"
			4:
				EsupportCharacterA = "Yaooan_norm"
		match chance2:
			0:
				EsupportCharacterB = null
			1:
				EsupportCharacterB = "Ventusr_norm"
			2:
				EsupportCharacterB = "Brooke_norm"
			3:
				EsupportCharacterB = "Tava_norm"
			4:
				EsupportCharacterB = "Yaooan_norm"
		match chance3:
			0:
				EsupportCharacterC = null
			1:
				EsupportCharacterC = "Ventusr_norm"
			2:
				EsupportCharacterC = "Brooke_norm"
			3:
				EsupportCharacterC = "Tava_norm"
			4:
				EsupportCharacterC = "Yaooan_norm"
	if roomLvl < 30 and roomLvl >= 20:
		bounty = round(rand_range(50,170))
		mainEnemyCharacter = "Ventusr_norm"
		var chance = randi() %5
		var chance2 = randi() %5
		var chance3 = randi() %5
		match chance:
			0:
				EsupportCharacterA = null
			1:
				EsupportCharacterA = "Ventusr_norm"
			2:
				EsupportCharacterA = "Brooke_norm"
			3:
				EsupportCharacterA = "Tava_norm"
			4:
				EsupportCharacterA = "Yaooan_norm"
		match chance2:
			0:
				EsupportCharacterB = null
			1:
				EsupportCharacterB = "Ventusr_norm"
			2:
				EsupportCharacterB = "Brooke_norm"
			3:
				EsupportCharacterB = "Tava_norm"
			4:
				EsupportCharacterB = "Yaooan_norm"
		match chance3:
			0:
				EsupportCharacterC = null
			1:
				EsupportCharacterC = "Ventusr_norm"
			2:
				EsupportCharacterC = "Brooke_norm"
			3:
				EsupportCharacterC = "Tava_norm"
			4:
				EsupportCharacterC = "Yaooan_norm"

func _roomIncrease():
	roomLvl += 1

func _roomDecrease():
	roomLvl = 0
	playerHealth = 100


func _on_Item_Shop_pressed():
	$Buttons/Recruiting_House.disabled = true
	$Buttons/Adventure.disabled = true
	$Buttons/Item_Shop.disabled = true
	$Buttons/Team_Organize.disabled = true
	$Buttons/OptionButton.disabled = true
	randomize()
	var k = shop.instance()
	k.currencyValue = currencyValue
	k.items = items
	$Arena.add_child(k)


func _on_Recruiting_House_pressed():
	$Buttons/Recruiting_House.disabled = true
	$Buttons/Adventure.disabled = true
	$Buttons/Item_Shop.disabled = true
	$Buttons/Team_Organize.disabled = true
	$Buttons/OptionButton.disabled = true
	$Buttons/Recruiting_House.disabled = true
	var k = Recruit.instance()
	$Arena.add_child(k)

func _increaseLvl(character):
	match character:
		"Norm_Ventusr":
			normVentusrLvl += 1
		"Norm_Brooke":
			normBrookeLvl += 1
		"Norm_Tava":
			normTavaLvl += 1
		"Norm_Yaooan":
			normYaooanLvl += 1
		"Norm_Queen":
			normQueenLvl += 1
		"Norm_Guard":
			normGuardLvl += 1


func _on_Team_Organize_pressed():
	$Buttons/Recruiting_House.disabled = true
	$Buttons/Adventure.disabled = true
	$Buttons/Item_Shop.disabled = true
	$Buttons/Team_Organize.disabled = true
	$Buttons/OptionButton.disabled = true
	$Buttons/Recruiting_House.disabled = true
	var k = organize.instance()
	k.normVentusrLvl = normVentusrLvl
	k.normBrookeLvl = normBrookeLvl
	k.normYaooanLvl = normYaooanLvl
	k.normTavaLvl = normTavaLvl
	k.normQueenLvl = normQueenLvl
	k.normGuardLvl = normGuardLvl
	$Arena.add_child(k)


func _on_OptionButton_pressed():
	pass
