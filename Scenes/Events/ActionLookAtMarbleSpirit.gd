extends Event

@onready var look_at_marble_spirit_button := $"../../CanvasLayer/LookAtMarbleSpiritButton"

func _on_event_started() -> void:
	look_at_marble_spirit_button.disabled = false
	await get_tree().create_timer(3.0).timeout
	AudioHandler.play_dialogue(AudioHandler.AudioKeys.LOOK_AT_MRBL_SPRT_CONTD)
	await AudioHandler.dialogue_player.finished
	_on_event_started()


func _on_look_at_marble_spirit_button_pressed():
	close_event()
