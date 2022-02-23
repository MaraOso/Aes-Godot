extends Node2D

var supportEneA = 0
var supportEneB = 0
var supportEneC = 0

var Lvl = 1

var Health = 120
var Max_Health = 120

var Support_Attr_1 = 1
var Support_Attr_2 = 0
var Support_Attr_3 = 2
var Main_Skill_Atk = 40
var Defend = 15
var startingDefense = 0
var PerryAtk = 15

var Position = 0

var isDead = false

var HealPower = 15
var AttackPower = 80
var DefensePower = 5

var EH = 10
var EP = 20
var ED = 20

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
