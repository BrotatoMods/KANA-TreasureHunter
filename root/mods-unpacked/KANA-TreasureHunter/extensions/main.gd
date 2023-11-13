extends "res://main.gd"


func on_consumable_picked_up(consumable: Node) -> void:
	.on_consumable_picked_up(consumable)

	if consumable.consumable_data.my_id == "kana_consumable_mysterious_scull" and RunData.effects["item_box_gold"] != 0:
		RunData.add_gold(RunData.effects["item_box_gold"])
		RunData.tracked_item_effects["item_bag"] += RunData.effects["item_box_gold"]

	# If a crate got collected
	if consumable.consumable_data.my_id == "consumable_item_box":
		RunData.tracked_item_effects["character_treasure_hunter"] += 1
