extends Node2D

var direction = 0
var attackID = 0
var power = 10

func _process(_delta):
	match attackID:
		0:
			pass
		1:
			#$Phoenix_Slice.visible = true
			self.position.x += direction
