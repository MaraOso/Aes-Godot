extends Node2D

var items = []

func _on_OptionButton_pressed():
	self.get_parent().get_parent()._return()
	self.queue_free()

func _process(_delta):
	_inventory()

func _inventory():
	$Buttons/DefenderCount.text = "x" + str(items.count("Defender"))
	$Buttons/BoosterCount.text = "x" + str(items.count("Booster"))
	$Buttons/RepairCount.text = "x" + str(items.count("Repair"))



func _on_Items_item_selected(index):
	match index:
		0:
			if items.count("Defender") > 0:
				self.get_parent().get_parent()._useItem(index)
				self.queue_free()
				self.get_parent().get_parent()._return()
			else:
				pass
		1:
			if items.count("Booster") > 0:
				self.get_parent().get_parent()._useItem(index)
				self.queue_free()
				self.get_parent().get_parent()._return()
			else:
				pass
		2:
			if items.count("Repair") > 0:
				self.get_parent().get_parent()._useItem(index)
				self.queue_free()
				self.get_parent().get_parent()._return()
			else:
				pass


	"""self.get_parent().get_parent()._useItem(index)
	self.queue_free()
	self.get_parent().get_parent()._return()"""
