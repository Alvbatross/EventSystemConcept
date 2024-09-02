extends Event

@onready var look_at_marble_spirit_button := $"../../CanvasLayer/LookAtMarbleSpiritButton"

func _on_event_started() -> void:
	look_at_marble_spirit_button.disabled = false
	await get_tree().create_timer(3.0).timeout
	play_event_sound()


func _on_look_at_marble_spirit_button_pressed():
	close_event()
