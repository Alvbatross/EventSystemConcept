extends Node2D


func _ready():
	var new_level = load("res://Scenes/Levels/Level1.tscn").instantiate()
	
	add_child(new_level)


func _on_change_level(level_file_path: String) -> void:
	AudioHandler.dialogue_player.stop()
	get_child(0).queue_free()
	var new_level = load("res://Scenes/Levels/" + level_file_path + ".tscn").instantiate()
	
	add_child(new_level)
	
	
