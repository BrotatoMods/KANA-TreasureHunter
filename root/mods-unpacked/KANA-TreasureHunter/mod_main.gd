extends Node


const KANA_TREASUREHUNTER_DIR := "KANA-TreasureHunter"
const KANA_TREASUREHUNTER_LOG_NAME := "KANA-TreasureHunter:Main"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

onready var KANA_bfx: Node = get_node("/root/ModLoader/KANA-BFX")


func _init(modLoader = ModLoader) -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(KANA_TREASUREHUNTER_DIR)
	# Add extensions
	install_script_extensions()
	# Add translations
	add_translations()


func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("singletons/run_data.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("main.gd"))



func add_translations() -> void:
	translations_dir_path = mod_dir_path.plus_file("translations")
	ModLoaderMod.add_translation("res://mods-unpacked/KANA-TreasureHunter/translations/translation.de.translation")
	ModLoaderMod.add_translation("res://mods-unpacked/KANA-TreasureHunter/translations/translation.en.translation")


func _ready() -> void:
	# Get the ContentLoader Class
	var ContentLoader := get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")
	var content_dir = mod_dir_path.plus_file("content_data")

	# Add content. These .tres files are ContentData resources
	ContentLoader.load_data(content_dir.plus_file("KANA_Treasure_Hunte_Content.tres"), KANA_TREASUREHUNTER_LOG_NAME)

	KANA_bfx.connect("consumable_spawn_triggered", self, "_on_kana_bfx_consumable_spawn_triggered")


func _on_kana_bfx_consumable_spawn_triggered(id: String, position: Vector2, triggered_by: Object) -> void:
	if triggered_by.weapon_id == "weapon_kana_shovel":
		RunData.tracked_item_effects["weapon_kana_shovel"] += 1
		triggered_by.emit_signal("tracked_value_updated")
