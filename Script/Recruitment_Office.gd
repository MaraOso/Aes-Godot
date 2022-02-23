extends Node2D

var isWaiting = false

func _on_Red_Envelope_pressed():
	if isWaiting == false:
		if $Recruit_Image/Img_Anima.get_current_animation() != "Open":
			$Buttons.z_index = 4
			$Recruit_Image/Img_Anima.play("Open")
		else:
			$Recruit_Image/Red_Packet.visible = true
			$Recruit_Image/Red_Packet.play("default")
			$Buttons/Red_Envelope.disabled = true
			$Buttons/Red_Envelope.visible = false
	if isWaiting == true:
		$Recruit_Image/Red_Packet.visible = true
		$Recruit_Image/Red_Packet.play("default")
		$Buttons/Red_Envelope.disabled = true
		$Buttons/Red_Envelope.visible = false
		


func _on_OptionButton_pressed():
	self.get_parent().get_parent()._return()
	self.queue_free()


func _on_Img_Anima_animation_finished(anim_name):
	if anim_name == "Open":
		isWaiting = true


func _on_Red_Packet_animation_finished():
	$Recruit_Image/Red_Packet.stop()
	$Recruit_Image/Red_Packet.frame = 2
	_characterSelected()

func _characterSelected():
	randomize()
	var choice = randi() % 101
	if choice <= 5:
		$Charcters/AnimatedSprite.play("Ventusr_Norm")
		self.get_parent().get_parent()._increaseLvl("Norm_Ventusr")
	if choice <= 15 and choice > 5:
		$Charcters/AnimatedSprite.play("Brooke_Norm")
		self.get_parent().get_parent()._increaseLvl("Norm_Brooke")
	if choice <= 25 and choice > 15:
		$Charcters/AnimatedSprite.play("Tava_Norm")
		self.get_parent().get_parent()._increaseLvl("Norm_Tava")
	if choice <= 50 and choice > 25:
		$Charcters/AnimatedSprite.play("Yaooan_Norm")
		self.get_parent().get_parent()._increaseLvl("Norm_Yaooan")
	if choice <= 75 and choice > 50:
		$Charcters/AnimatedSprite.play("Guard_Norm")
		self.get_parent().get_parent()._increaseLvl("Norm_Guard")
	if choice <= 100 and choice > 75:
		$Charcters/AnimatedSprite.play("Queen_Norm")
		self.get_parent().get_parent()._increaseLvl("Norm_Queen")
	$Charcters/AnimatedSprite.visible = true
