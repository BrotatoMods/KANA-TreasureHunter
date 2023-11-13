class_name KANAEnemyProjectile
extends "res://projectiles/bullet_enemy/enemy_projectile.gd"


export(Array, Resource) var hit_sounds
export(Array, float) var volume_mods
export(int) var damage_base
export(float) var damage_increase_each_wave


func _ready() -> void:
	.call_deferred("set_damage", (damage_base + (RunData.current_wave - 1) * damage_increase_each_wave) as int)


func kana_play_sound() -> void:
	var hit_sound_index = Utils.get_random_int(0, hit_sounds.size() - 1)
	SoundManager.play(hit_sounds[hit_sound_index], volume_mods[hit_sound_index], 0.2)
