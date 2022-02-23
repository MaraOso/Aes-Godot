extends Node2D

var supportEneA = 0
var supportEneB = 0
var supportEneC = 0

var Lvl = 1

var Health = 55
var Max_Health = 55

var Support_Attr_1 = 1
var Support_Attr_2 = 2
var Support_Attr_3 = 0
var Main_Skill_Atk = 30
var Defend = 50
var startingDefense = 30
var PerryAtk = 10

var Position = 0

var isDead = false

var HealPower = 15
var AttackPower = 5
var DefensePower = 20

var EH = 25
var EP = 10
var ED = 30

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
