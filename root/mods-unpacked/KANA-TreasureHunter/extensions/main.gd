extends "res://main.gd"


func on_consumable_picked_up(consumable: Node) -> void:
	.on_consumable_picked_up(consumable)

	# If a crate got collected
	if consumable.consumable_data.my_id == "consumable_item_box":
		RunData.tracked_item_effects["character_treasure_hunter"] += 1
