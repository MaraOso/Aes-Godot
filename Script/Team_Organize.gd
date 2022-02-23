extends Node2D

var spaceSelected = 0

var supportCharacterA = null
var supportCharacterB = null
var supportCharacterC = null
var mainCharacter = null

var normVentusrLvl = 0
var normBrookeLvl = 0
var normYaooanLvl = 0
var normTavaLvl = 0
var normQueenLvl = 0
var normGuardLvl = 0


func _on_SupportA_pressed():
	spaceSelected = 1


func _on_SupportC_pressed():
	spaceSelected = 3


func _on_Main_pressed():
	spaceSelected = 4


func _on_OptionButton_pressed():
	self.get_parent().get_parent().supportCharacterA = supportCharacterA
	self.get_parent().get_parent().supportCharacterB = supportCharacterB
	self.get_parent().get_parent().supportCharacterC = supportCharacterC
	self.get_parent().get_parent().mainCharacter = mainCharacter
	self.get_parent().get_parent()._return()
	self.queue_free()


func _on_ItemList_item_selected(index):
	match spaceSelected:
		0:
			pass
		1:
			match index:
				0:
					$Buttons/Character_Text.text = "Boost Attack of Main Character by 20"
					if normVentusrLvl > 0:
						if supportCharacterB != "Ventusr_norm" and supportCharacterC != "Ventusr_norm" and mainCharacter != "Ventusr_norm":
							$Character_Display/SupportA.frame = 1
							supportCharacterA = "Ventusr_norm"
				1:
					$Buttons/Character_Text.text = "Heals the Main Character for 10HP"
					if normBrookeLvl > 0:
						if supportCharacterB != "Brooke_norm" and supportCharacterC != "Brooke_norm" and mainCharacter != "Brooke_norm":
							$Character_Display/SupportA.frame = 2
							supportCharacterA = "Brooke_norm"
				2:
					supportCharacterA = null
					$Character_Display/SupportA.frame = 0
				3:
					$Buttons/Character_Text.text = "Boost Attack of Main Character by 5"
					if normTavaLvl > 0:
						if supportCharacterB != "Tava_norm" and supportCharacterC != "Tava_norm" and mainCharacter != "Tava_norm":
							$Character_Display/SupportA.frame = 3
							supportCharacterA = "Tava_norm"
				4:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normYaooanLvl > 0:
						if supportCharacterB != "Yaooan_norm" and supportCharacterC != "Yaooan_norm" and mainCharacter != "Yaooan_norm":
							$Character_Display/SupportA.frame = 4
							supportCharacterA = "Yaooan_norm"
				5:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normQueenLvl > 0:
						if supportCharacterB != "Queen_norm" and supportCharacterC != "Queen_norm" and mainCharacter != "Queen_norm":
							$Character_Display/SupportA.frame = 5
							supportCharacterA = "Queen_norm"
				6:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normGuardLvl > 0:
						if supportCharacterB != "Guard_norm" and supportCharacterC != "Guard_norm" and mainCharacter != "Guard_norm":
							$Character_Display/SupportA.frame = 6
							supportCharacterA = "Guard_norm"
				
		2:
			match index:
				0:
					$Buttons/Character_Text.text = "Slows down time to allow Main Character to react to attacks"
					if normVentusrLvl > 0:
						if supportCharacterA != "Ventusr_norm" and supportCharacterC != "Ventusr_norm" and mainCharacter != "Ventusr_norm":
							$Character_Display/SupportB.frame = 1
							supportCharacterB = "Ventusr_norm"
				1:
					if normBrookeLvl > 0:
						$Buttons/Character_Text.text = "Boost Attack of Main Character by 30"
						if supportCharacterA != "Brooke_norm" and supportCharacterC != "Brooke_norm" and mainCharacter != "Brooke_norm":
							$Character_Display/SupportB.frame = 2
							supportCharacterB = "Brooke_norm"
				2:
					supportCharacterB = null
					$Character_Display/SupportB.frame = 0
				3:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 20"
					if normTavaLvl > 0:
						if supportCharacterA != "Tava_norm" and supportCharacterC != "Tava_norm" and mainCharacter != "Tava_norm":
							$Character_Display/SupportB.frame = 3
							supportCharacterB = "Tava_norm"
				4:
					$Buttons/Character_Text.text = "Heals the Main Character for 5HP"
					if normYaooanLvl > 0:
						if supportCharacterA != "Yaooan_norm" and supportCharacterC != "Yaooan_norm" and mainCharacter != "Yaooan_norm":
							$Character_Display/SupportB.frame = 4
							supportCharacterB = "Yaooan_norm"
				5:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normQueenLvl > 0:
						if supportCharacterA != "Queen_norm" and supportCharacterC != "Queen_norm" and mainCharacter != "Queen_norm":
							$Character_Display/SupportB.frame = 5
							supportCharacterB = "Queen_norm"
				6:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normGuardLvl > 0:
						if supportCharacterA != "Guard_norm" and supportCharacterC != "Guard_norm" and mainCharacter != "Guard_norm":
							$Character_Display/SupportB.frame = 6
							supportCharacterB = "Guard_norm"
		3:
			match index:
				0:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 30"
					if normVentusrLvl > 0:
						if supportCharacterB != "Ventusr_norm" and supportCharacterA != "Ventusr_norm" and mainCharacter != "Ventusr_norm":
							$Character_Display/SupportC.frame = 1
							supportCharacterC = "Ventusr_norm"
				1:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 10"
					if normBrookeLvl > 0:
						if supportCharacterB != "Brooke_norm" and supportCharacterA != "Brooke_norm" and mainCharacter != "Brooke_norm":
							$Character_Display/SupportC.frame = 2
							supportCharacterC = "Brooke_norm"
				2:
					supportCharacterC = null
					$Character_Display/SupportC.frame = 0
				3:
					$Buttons/Character_Text.text = "Heals the Main Character for 15HP"
					if normTavaLvl > 0:
						if supportCharacterA != "Tava_norm" and supportCharacterB != "Tava_norm" and mainCharacter != "Tava_norm":
							$Character_Display/SupportC.frame = 3
							supportCharacterC = "Tava_norm"
				4:
					$Buttons/Character_Text.text = "Boost Attack of Main Character by 5"
					if normYaooanLvl > 0:
						if supportCharacterA != "Yaooan_norm" and supportCharacterB != "Yaooan_norm" and mainCharacter != "Yaooan_norm":
							$Character_Display/SupportC.frame = 4
							supportCharacterC = "Yaooan_norm"
				5:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normQueenLvl > 0:
						if supportCharacterB != "Queen_norm" and supportCharacterA != "Queen_norm" and mainCharacter != "Queen_norm":
							$Character_Display/SupportC.frame = 5
							supportCharacterC = "Queen_norm"
				6:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normGuardLvl > 0:
						if supportCharacterB != "Guard_norm" and supportCharacterA != "Guard_norm" and mainCharacter != "Guard_norm":
							$Character_Display/SupportC.frame = 6
							supportCharacterC = "Guard_norm"
		4:
			match index:
				0:
					$Buttons/Character_Text.text = "Deals 30HP worth of Damage"
					if normVentusrLvl > 0:
						if supportCharacterB != "Ventusr_norm" and supportCharacterC != "Ventusr_norm" and supportCharacterA != "Ventusr_norm":
							$Character_Display/Main.frame = 1
							mainCharacter = "Ventusr_norm"
				1:
					$Buttons/Character_Text.text = "Deals 70HP worth of Damage"
					if normBrookeLvl > 0:
						if supportCharacterB != "Brooke_norm" and supportCharacterC != "Brooke_norm" and supportCharacterA != "Brooke_norm":
							$Character_Display/Main.frame = 2
							mainCharacter = "Brooke_norm"
				2:
					mainCharacter = null
					$Character_Display/Main.frame = 0
				3:
					$Buttons/Character_Text.text = "Deals 25HP worth of Damage"
					if normTavaLvl > 0:
						if supportCharacterA != "Tava_norm" and supportCharacterB != "Tava_norm" and supportCharacterC != "Tava_norm":
							$Character_Display/Main.frame = 3
							mainCharacter = "Tava_norm"
				4:
					$Buttons/Character_Text.text = "Boost Attack of Main Character by 5"
					if normYaooanLvl > 0:
						if supportCharacterA != "Yaooan_norm" and supportCharacterB != "Yaooan_norm" and supportCharacterC != "Yaooan_norm":
							$Character_Display/Main.frame = 4
							mainCharacter = "Yaooan_norm"
				5:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normQueenLvl > 0:
						if supportCharacterB != "Queen_norm" and supportCharacterA != "Queen_norm" and supportCharacterC != "Queen_norm":
							$Character_Display/Main.frame = 5
							mainCharacter = "Queen_norm"
				6:
					$Buttons/Character_Text.text = "Increase Defense of Main Character by 5"
					if normGuardLvl > 0:
						if supportCharacterB != "Guard_norm" and supportCharacterA != "Guard_norm" and supportCharacterC != "Guard_norm":
							$Character_Display/Main.frame = 6
							mainCharacter = "Guard_norm"


func _on_SupportB_pressed():
	spaceSelected = 2
