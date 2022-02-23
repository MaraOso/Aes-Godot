extends Node2D

var attackvar = preload("res://Scenes/Attacks/Attacks.tscn")
var norm_Ventusr = preload("res://Scenes/Characters/Norm_Ventusr_Restricted.tscn")
var norm_Brooke = preload("res://Scenes/Characters/Norm_Brooke_Restricted.tscn")
var norm_Tava = preload("res://Scenes/Characters/Norm_Tava_Restricted.tscn")
var norm_Yaooan = preload("res://Scenes/Characters/Norm_Yaooan_Normal.tscn")
var norm_Queen = preload("res://Scenes/Characters/Norm_Queen_Norm.tscn")
var norm_Guard = preload("res://Scenes/Characters/Norm_Guard.tscn")

var itemList = preload("res://Scenes/Popup_Items.tscn")

var availableCharacters = []
var items = []

var playerHealth = 0

var turn = 0
var roomLvl = 0

var enemyisAttacking = false

var Support_Attr_1 = null
var Support_Attr_2 = null
var Support_Attr_3 = null

var supportCharacterA = null
var supportCharacterB = null
var supportCharacterC = null
var mainCharacter = null

var EsupportCharacterA = null
var EsupportCharacterB = null
var EsupportCharacterC = null
var mainEnemyCharacter = null

var sAHealth = 0
var sBHealth = 0
var sCHealth = 0

var sADefense = 0
var sBDefense = 0
var sCDefense = 0

var sAAttack = 0
var sBAttack = 0
var sCAttack = 0

var EA = false
var EB = false
var EC = false

var EneAttackA = 0
var EneAttackB = 0
var EneAttackC = 0

var EneHealthA = 0
var EneHealthB = 0
var EneHealthC = 0

var EneDefenseA = 0
var EneDefenseB = 0
var EneDefenseC = 0

var normVentusrLvl = 0
var normBrookeLvl = 0
var normTavaLvl = 0
var normYaooanLvl = 0
var normQueenLvl = 0
var normGuardLvl = 0

var slowdown = 1

func _ready():
	match mainCharacter:
		"Ventusr_norm":
			var k = norm_Ventusr.instance()
			k.Health = playerHealth
			k.Lvl = normVentusrLvl
			$Characters/Main_Character.add_child(k)
		"Brooke_norm":
			var k = norm_Brooke.instance()
			k.Health = playerHealth
			k.Lvl = normBrookeLvl
			$Characters/Main_Character.add_child(k)
		"Tava_norm":
			var k = norm_Tava.instance()
			k.Health = playerHealth
			k.Lvl = normTavaLvl
			$Characters/Main_Character.add_child(k)
		"Yaooan_norm":
			var k = norm_Yaooan.instance()
			k.Health = playerHealth
			k.Lvl = normYaooanLvl
			$Characters/Main_Character.add_child(k)
		"Guard_norm":
			var k = norm_Guard.instance()
			k.Health = playerHealth
			k.Lvl = normGuardLvl
			$Characters/Main_Character.add_child(k)
		"Queen_norm":
			var k = norm_Queen.instance()
			k.Health = playerHealth
			k.Lvl = normQueenLvl
			$Characters/Main_Character.add_child(k)

	match supportCharacterA:
		null:
			pass
		"Ventusr_norm":
			var k = norm_Ventusr.instance()
			$Characters/SupportA.add_child(k)
		"Brooke_norm":
			var k = norm_Brooke.instance()
			$Characters/SupportA.add_child(k)
		"Tava_norm":
			var k = norm_Tava.instance()
			$Characters/SupportA.add_child(k)
		"Yaooan_norm":
			var k = norm_Yaooan.instance()
			$Characters/SupportA.add_child(k)
		"Queen_norm":
			var k = norm_Queen.instance()
			$Characters/SupportA.add_child(k)
		"Guard_norm":
			var k = norm_Guard.instance()
			$Characters/SupportA.add_child(k)

	match supportCharacterB:
		null:
			pass
		"Ventusr_norm":
			var k = norm_Ventusr.instance()
			$Characters/SupportB.add_child(k)
		"Brooke_norm":
			var k = norm_Brooke.instance()
			$Characters/SupportB.add_child(k)
		"Tava_norm":
			var k = norm_Tava.instance()
			$Characters/SupportB.add_child(k)
		"Yaooan_norm":
			var k = norm_Yaooan.instance()
			$Characters/SupportB.add_child(k)
		"Queen_norm":
			var k = norm_Queen.instance()
			$Characters/SupportB.add_child(k)
		"Guard_norm":
			var k = norm_Guard.instance()
			$Characters/SupportB.add_child(k)

	match supportCharacterC:
		null:
			pass
		"Ventusr_norm":
			var k = norm_Ventusr.instance()
			$Characters/SupportC.add_child(k)
		"Brooke_norm":
			var k = norm_Brooke.instance()
			$Characters/SupportC.add_child(k)
		"Tava_norm":
			var k = norm_Tava.instance()
			$Characters/SupportC.add_child(k)
		"Yaooan_norm":
			var k = norm_Yaooan.instance()
			$Characters/SupportC.add_child(k)
		"Queen_norm":
			var k = norm_Queen.instance()
			$Characters/SupportC.add_child(k)
		"Guard_norm":
			var k = norm_Guard.instance()
			$Characters/SupportC.add_child(k)

	match EsupportCharacterA:
		null:
			pass
		"Ventusr_norm":
			var k = norm_Ventusr.instance()
			$Characters/Enemiess/Enemy_SupportA.add_child(k)
		"Brooke_norm":
			var k = norm_Brooke.instance()
			$Characters/Enemiess/Enemy_SupportA.add_child(k)
		"Tava_norm":
			var k = norm_Tava.instance()
			$Characters/Enemiess/Enemy_SupportA.add_child(k)
		"Yaooan_norm":
			var k = norm_Yaooan.instance()
			$Characters/Enemiess/Enemy_SupportA.add_child(k)
		"Queen_norm":
			var k = norm_Queen.instance()
			$Characters/Enemiess/Enemy_SupportA.add_child(k)
		"Guard_norm":
			var k = norm_Guard.instance()
			$Characters/Enemiess/Enemy_SupportA.add_child(k)

	match EsupportCharacterB:
		null:
			pass
		"Ventusr_norm":
			var k = norm_Ventusr.instance()
			$Characters/Enemiess/Enemy_SupportB.add_child(k)
		"Brooke_norm":
			var k = norm_Brooke.instance()
			$Characters/Enemiess/Enemy_SupportB.add_child(k)
		"Tava_norm":
			var k = norm_Tava.instance()
			$Characters/Enemiess/Enemy_SupportB.add_child(k)
		"Yaooan_norm":
			var k = norm_Yaooan.instance()
			$Characters/Enemiess/Enemy_SupportB.add_child(k)
		"Queen_norm":
			var k = norm_Queen.instance()
			$Characters/Enemiess/Enemy_SupportB.add_child(k)
		"Guard_norm":
			var k = norm_Guard.instance()
			$Characters/Enemiess/Enemy_SupportB.add_child(k)

	match EsupportCharacterC:
		null:
			pass
		"Ventusr_norm":
			var k = norm_Ventusr.instance()
			$Characters/Enemiess/Enemy_SupportC.add_child(k)
		"Brooke_norm":
			var k = norm_Brooke.instance()
			$Characters/Enemiess/Enemy_SupportC.add_child(k)
		"Tava_norm":
			var k = norm_Tava.instance()
			$Characters/Enemiess/Enemy_SupportC.add_child(k)
		"Yaooan_norm":
			var k = norm_Yaooan.instance()
			$Characters/Enemiess/Enemy_SupportC.add_child(k)
		"Queen_norm":
			var k = norm_Queen.instance()
			$Characters/Enemiess/Enemy_SupportC.add_child(k)
		"Guard_norm":
			var k = norm_Guard.instance()
			$Characters/Enemiess/Enemy_SupportC.add_child(k)

	match mainEnemyCharacter:
		null:
			pass
		"Ventusr_norm":
			var k = norm_Ventusr.instance()
			$Characters/Enemiess/Main_Enemy.add_child(k)
		"Brooke_norm":
			var k = norm_Brooke.instance()
			$Characters/Enemiess/Main_Enemy.add_child(k)
		"Tava_norm":
			var k = norm_Tava.instance()
			$Characters/Enemiess/Main_Enemy.add_child(k)
		"Yaooan_norm":
			var k = norm_Yaooan.instance()
			$Characters/Enemiess/Main_Enemy.add_child(k)
		"Queen_norm":
			var k = norm_Queen.instance()
			$Characters/Enemiess/Main_Enemy.add_child(k)
		"Guard_norm":
			var k = norm_Guard.instance()
			$Characters/Enemiess/Main_Enemy.add_child(k)

func _process(_delta):
	_Main_Character_Calc()
	_turnControl()
	_roomDisplay()
	_enemyAttack()

func _enemyAttack():
	match enemyisAttacking:
		true:
			$Blocker/DeadNode.position = Vector2(-730, 0)
		false:
			$Blocker/DeadNode.position = Vector2(-330, 0)

func _roomDisplay():
	$Buttons/RoomLevel.text = "Area: " + str(roomLvl)

func _Main_Character_Calc():
	for Character in $Areas/Main.get_overlapping_areas():
		if Character.is_in_group("Character"):
			$Buttons/PlayerHealth.value = Character.get_parent().Health
			$Buttons/PlayerHealth.max_value = Character.get_parent().Max_Health
			$Buttons/MainHealth.text = str(Character.get_parent().Health) + "/" + str(Character.get_parent().Max_Health)
			if Character.get_parent().isDead == true:
				turn = 2

	for Character in $Areas/First_Support.get_overlapping_areas():
		if Character.is_in_group("Character"):
			Support_Attr_1 = Character.get_parent().Support_Attr_1
			$Buttons/SupportA.disabled = false
			sAAttack = Character.get_parent().AttackPower
			sADefense = Character.get_parent().DefensePower
			sAHealth = Character.get_parent().HealPower
			match Support_Attr_1:
				null:
					$Buttons/SupportA/Label.text = "No Allies"
				0:
					$Buttons/SupportA/Label.text = "Heal +" + str(sAHealth)
				1:
					$Buttons/SupportA/Label.text = "Powerup +" + str(sAAttack)
				2:
					$Buttons/SupportA/Label.text = "Defense +" + str(sADefense)
				3:
					$Buttons/SupportA/Label.text = "Slowdown Time"

	for Character in $Areas/Second_Support.get_overlapping_areas():
		if Character.is_in_group("Character"):
			Support_Attr_2 = Character.get_parent().Support_Attr_2
			$Buttons/SupportB.disabled = false
			sBAttack = Character.get_parent().AttackPower
			sBDefense = Character.get_parent().DefensePower
			sBHealth = Character.get_parent().HealPower
			match Support_Attr_2:
				null:
					$Buttons/SupportB/Label.text = "No Allies"
				0:
					$Buttons/SupportB/Label.text = "Heal +" + str(sBHealth)
				1:
					$Buttons/SupportB/Label.text = "Powerup +" + str(sBAttack)
				2:
					$Buttons/SupportB/Label.text = "Defense +" + str(sBDefense)
				3:
					$Buttons/SupportB/Label.text = "Slowdown Time"

	for Character in $Areas/Third_Support.get_overlapping_areas():
		if Character.is_in_group("Character"):
			Support_Attr_3 = Character.get_parent().Support_Attr_3
			$Buttons/SupportC.disabled = false
			sCAttack = Character.get_parent().AttackPower
			sCDefense = Character.get_parent().DefensePower
			sCHealth = Character.get_parent().HealPower
			match Support_Attr_3:
				null:
					$Buttons/SupportC/Label.text = "No Allies"
				0:
					$Buttons/SupportC/Label.text = "Heal +" + str(sCHealth)
				1:
					$Buttons/SupportC/Label.text = "Powerup +" + str(sCAttack)
				2:
					$Buttons/SupportC/Label.text = "Defense +" + str(sCDefense)
				3:
					$Buttons/SupportC/Label.text = "Slowdown Time"

	for Character in $Areas/Main_Enemy.get_overlapping_areas():
		if Character.is_in_group("Character"):
			if Character.get_parent().get_child(0).flip_h == false:
				Character.get_parent().get_child(0).flip_h = true
			$Buttons/EnemyHealth.value = Character.get_parent().Health
			$Buttons/EnemyHealth.max_value = Character.get_parent().Max_Health
			$Buttons/EnemyHealthNumber.text = str(Character.get_parent().Health) + "/" + str(Character.get_parent().Max_Health)

	for Character in $Areas/Enemy_First_Support.get_overlapping_areas():
		if Character.is_in_group("Character"):
			EA = true
			EneAttackA = Character.get_parent().EP
			EneDefenseA = Character.get_parent().ED
			EneHealthA = Character.get_parent().EH
			if Character.get_parent().get_child(0).flip_h == false:
				Character.get_parent().get_child(0).flip_h = true

	for Character in $Areas/Enemy_Second_Support.get_overlapping_areas():
		if Character.is_in_group("Character"):
			EB = true
			EneAttackB = Character.get_parent().EP
			EneDefenseB = Character.get_parent().ED
			EneHealthB = Character.get_parent().EH
			if Character.get_parent().get_child(0).flip_h == false:
				Character.get_parent().get_child(0).flip_h = true

	for Character in $Areas/Enemy_Third_Support.get_overlapping_areas():
		if Character.is_in_group("Character"):
			EC = true
			EneAttackC = Character.get_parent().EP
			EneDefenseC = Character.get_parent().ED
			EneHealthC = Character.get_parent().EH
			if Character.get_parent().get_child(0).flip_h == false:
				Character.get_parent().get_child(0).flip_h = true


func _on_OptionButton_pressed():
	self.get_parent().get_parent()._return()
	self.queue_free()


func _on_PerryButton_pressed():
	$Screen_Image/QuickTime/HeartMotion.stop()
	if $Screen_Image/QuickTime/Heart.position.x < ($Screen_Image/QuickTime/QickTime_Bar/QickTime_Bar2.position.x) + 3 and $Screen_Image/QuickTime/Heart.position.x > ($Screen_Image/QuickTime/QickTime_Bar/QickTime_Bar2.position.x - 3):
		$Characters/Enemiess/Main_Enemy.get_child(0)._damage($Characters/Main_Character.get_child(0).PerryAtk)
		$Characters/Main_Character.get_child(0)._attack()
		if $Attacks.get_child(0) != null:
			$Attacks.get_child(0).queue_free()
		turn = 0


func _on_DefendButton_pressed():
	$Screen_Image/QuickTime/HeartMotion.stop()
	if $Screen_Image/QuickTime/Heart.position.x < ($Screen_Image/QuickTime/QickTime_Bar.position.x - 100) + 200 and $Screen_Image/QuickTime/Heart.position.x > ($Screen_Image/QuickTime/QickTime_Bar.position.x - 100):
		if $Attacks.get_child(0) != null:
			$Attacks.get_child(0).queue_free()
		turn = 0


func _on_MainAtk_pressed():
	$Characters/Main_Character.get_child(0)._attack()
	var k = attackvar.instance()
	k.direction = 1
	k.attackID = 1
	k.power = $Characters/Main_Character.get_child(0).Main_Skill_Atk
	$Attacks.add_child(k)
	$Buttons/MainAtk.disabled = true


func _on_SupportA_pressed():
	match Support_Attr_1:
		null:
			$Buttons/SupportA/Label.text = "No Allies"
		0:
			$Characters/Main_Character.get_child(0)._heal(sAHealth)
		1:
			$Characters/Main_Character.get_child(0)._powerup(sAAttack)
		2:
			$Characters/Main_Character.get_child(0)._defense(sADefense)
		3:
			slowdown = .5
	turn = 1
	$TurnTimer.start()
	$Buttons/SupportA.disabled = true


func _on_SupportB_pressed():
	match Support_Attr_2:
		null:
			$Buttons/SupportA/Label.text = "No Allies"
		0:
			$Characters/Main_Character.get_child(0)._heal(sBHealth)
		1:
			$Characters/Main_Character.get_child(0)._powerup(sBAttack)
		2:
			$Characters/Main_Character.get_child(0)._defense(sBDefense)
		3:
			slowdown = .5
	turn = 1
	$TurnTimer.start()
	$Buttons/SupportB.disabled = true


func _on_SupportC_pressed():
	match Support_Attr_3:
		null:
			$Buttons/SupportA/Label.text = "No Allies"
		0:
			$Characters/Main_Character.get_child(0)._heal(sCHealth)
		1:
			$Characters/Main_Character.get_child(0)._powerup(sCAttack)
		2:
			$Characters/Main_Character.get_child(0)._defense(sCDefense)
		3:
			slowdown = .5
	turn = 1
	$TurnTimer.start()
	$Buttons/SupportC.disabled = true


func _on_SwitchChrt_pressed():
	$Buttons/SwitchChrt.disabled = true
	var k = itemList.instance()
	k.items = items
	$ItemHolder.add_child(k)

func _return():
	$Buttons/SwitchChrt.disabled = false

func _useItem(index):
	match index:
		0: #Defend
			$Characters/Main_Character.get_child(0).Defend = $Characters/Main_Character.get_child(0).Defend + 100
			items.erase("Defender")
		1: #Booster
			$Characters/Main_Character.get_child(0).Main_Skill_Atk = $Characters/Main_Character.get_child(0).Main_Skill_Atk + 20
			items.erase("Booster")
		2: #Repair
			$Characters/Main_Character.get_child(0).Health = $Characters/Main_Character.get_child(0).Health + 50
			items.erase("Repair")

func _enemyTurn():
	if $Characters/Enemiess/Main_Enemy.get_child(0).isDead == false:
		$Blocker/DeadNode.position = Vector2(-730, 0)
		var choice = randi()%4
		match choice:
			0:
				$Characters/Enemiess/Main_Enemy.get_child(0)._attack()
				var k = attackvar.instance()
				k.direction = -1
				k.attackID = 1
				k.power = $Characters/Enemiess/Main_Enemy.get_child(0).Main_Skill_Atk
				$Attacks.add_child(k)
				_quickTime()
				enemyisAttacking = true
				$Buttons/AttackName.text = "Attack"
			1:
				match EB:
					false:
						$Characters/Enemiess/Main_Enemy.get_child(0)._powerup(10)
						turn = 0
					true:
						$Characters/Enemiess/Main_Enemy.get_child(0).supportEneB = 10
						$Characters/Enemiess/Main_Enemy.get_child(0)._powerup(EneAttackB)
						turn = 0
				$Buttons/AttackName.text = "Power Up Attack"
			2:
				match EA:
					false:
						$Characters/Enemiess/Main_Enemy.get_child(0)._heal(50)
						turn = 0
					true:
						$Characters/Enemiess/Main_Enemy.get_child(0).supportEneA = 50
						$Characters/Enemiess/Main_Enemy.get_child(0)._heal(EneHealthA)
						turn = 0
				$Buttons/AttackName.text = "Healing"
			3:
				match EC:
					false:
						$Characters/Enemiess/Main_Enemy.get_child(0)._defense(10)
						turn = 0
					true:
						$Characters/Enemiess/Main_Enemy.get_child(0).supportEneC = 10
						$Characters/Enemiess/Main_Enemy.get_child(0)._defense(EneDefenseC)
						turn = 0
				$Buttons/AttackName.text = "Toughen up Defense"
	else:
		$Blocker/DeadNode.position = Vector2(-330, 0)
		$Characters/Main_Character.get_child(0)._win()
		if supportCharacterA != null:
			$Characters/SupportA.get_child(0)._win()
		if supportCharacterB != null:
			$Characters/SupportB.get_child(0)._win()
		if supportCharacterC != null:
			$Characters/SupportC.get_child(0)._win()
		turn = 3
		$TurnTimer.start()


func _on_Main_area_entered(area):
	if area.is_in_group("Attack"):
		$Screen_Image/QuickTime/HeartMotion.stop()
		$Characters/Main_Character.get_child(0)._damage(area.get_parent().get_parent().get("power"))
		$Attacks.get_child(0).queue_free()
		turn = 0
		$TurnTimer.start()


func _on_Main_Enemy_area_entered(area):
	if area.is_in_group("Attack"):
		$Screen_Image/QuickTime/HeartMotion.stop()
		$Characters/Enemiess/Main_Enemy.get_child(0)._damage(area.get_parent().get_parent().get("power"))
		$Attacks.get_child(0).queue_free()
		turn = 1
		$TurnTimer.start()


func _on_TurnTimer_timeout():
	enemyisAttacking = false
	match turn:
		0:
			$Buttons/MainAtk.disabled = false
			#$Buttons/SupportA.disabled = false
			#$Buttons/SupportB.disabled = false
			#$Buttons/SupportC.disabled = false
			slowdown = 1
		1:
			_enemyTurn()
			$Buttons/MainAtk.disabled = true
			$Buttons/SupportA.disabled = true
			$Buttons/SupportB.disabled = true
			$Buttons/SupportC.disabled = true
		2:
			self.get_parent().get_parent()._roomDecrease()
			self.get_parent().get_parent()._return()
			self.queue_free()
		3:
			self.get_parent().get_parent()._roomIncrease()
			self.get_parent().get_parent()._bountyIncrease()
			self.get_parent().get_parent()._return()
			self.get_parent().get_parent().playerHealth = $Characters/Main_Character.get_child(0).Health
			self.queue_free()

func _turnControl():
	match turn:
		0:
			$Blocker.position = Vector2(36, 1035)
		1:
			$Blocker.position = Vector2(360, 1035)

func _quickTime():
	randomize()
	$Screen_Image/QuickTime/QickTime_Bar.set_position(Vector2(rand_range(100, 620), 7))
	$Screen_Image/QuickTime/HeartMotion.play("HeartMove")
	$Screen_Image/QuickTime/HeartMotion.set_speed_scale((rand_range(1.2,2) * slowdown))
