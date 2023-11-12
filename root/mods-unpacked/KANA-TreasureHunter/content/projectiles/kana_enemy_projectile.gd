class_name KANAEnemyProjectile
extends EnemyProjectile


export(Array, Resource) var hit_sounds
export(Array, float) var volume_mods


func play_sound() -> void:
	var hit_sound_index = Utils.get_random_int(0, hit_sounds.size() - 1)
	SoundManager.play(hit_sounds[hit_sound_index], volume_mods[hit_sound_index], 0.2)
