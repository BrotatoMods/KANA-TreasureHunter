extends Enemy


export(Resource) var spawn_sound


func _ready() -> void:
	SoundManager2D.play(spawn_sound, global_position, 15, 0.2)


func update_animation(movement:Vector2) -> void:
	if mirror_sprite_with_movement:
		if movement.x > 0:
			_animation_player.play("roll_forwards")
		elif movement.x < 0:
			_animation_player.play("roll_backwards")
