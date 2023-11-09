extends "res://singletons/run_data.gd"


func init_tracked_effects() -> Dictionary:
	var vanilla = .init_tracked_effects()
	var custom_tracker = {
		"character_treasure_hunter": 0,
	}

	vanilla.merge(custom_tracker)

	return vanilla
