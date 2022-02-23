extends Node2D

var supportEneA = 0
var supportEneB = 0
var supportEneC = 0

var Lvl = 1

var Health = 30
var Max_Health = 30

var Support_Attr_1 = 2
var Support_Attr_2 = 0
var Support_Attr_3 = 1
var Main_Skill_Atk = 25
var Defend = 5
var startingDefense = 5
var PerryAtk = 10

var Position = 0

var isDead = false

var HealPower = 5
var AttackPower = 5
var DefensePower = 5

var EH = 5
var EP = 5
var ED = 5

func _ready():
	$AnimatedSprite.play("Idle")


func _heal(healing):
	if isDead == false:
		#$AnimatedSprite.play("Heal")
		if Health < Max_Health:
			Health += healing + supportEneA

func _powerup(power):
	if isDead == false:
		#$AnimatedSprite.play("Powerup")
		Main_Skill_Atk += power + supportEneB

func _defense(blocking):
	if isDead == false:
		#$AnimatedSprite.play("Defense")
		Defend += blocking + supportEneC

func _attack():
	if isDead == false:
		pass
		#$AnimatedSprite.play("Attack")

func _damage(pain):
	if isDead == false:
		if Defend <= pain:
			Health -= (pain - Defend)
			Defend = startingDefense
			#$AnimatedSprite.play("Damage")
		else:
			Defend = startingDefense
			#$AnimatedSprite.play("Blocked")

func _win():
	pass
	#$AnimatedSprite.play("Win")

func _on_AnimatedSprite_animation_finished():
	if not $AnimatedSprite.animation == "Faint":
		if Health <= 0:
			$AnimatedSprite.play("Faint")
			isDead = true
		else:
			$AnimatedSprite.play("Idle")
	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.animation = "Faint"
		$AnimatedSprite.frame = 4
