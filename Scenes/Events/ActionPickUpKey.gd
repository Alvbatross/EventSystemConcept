extends Event

@onready var pick_up_key_button = $"../../CanvasLayer/PickUpKey"

func _on_event_started():
	pick_up_key_button.disabled = false
	await get_tree().create_timer(3.0).timeout
	play_event_sound()


func _on_pick_up_key_pressed():
	close_event()
