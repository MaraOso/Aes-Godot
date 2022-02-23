extends Node2D

var supportEneA = 0
var supportEneB = 0
var supportEneC = 0

var Lvl = 1

var Health = 80
var Max_Health = 80

var Support_Attr_1 = 2
var Support_Attr_2 = 1
var Support_Attr_3 = 0
var Main_Skill_Atk = 80
var Defend = 5
var startingDefense = 0
var PerryAtk = 30

var Position = 0

var isDead = false

var HealPower = 0
var AttackPower = 60
var DefensePower = 5

var EH = 10
var EP = 70
var ED = 10

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
