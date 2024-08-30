extends Event


func _on_event_started() -> void:
	AudioHandler.play_dialogue(AudioHandler.AudioKeys.LOOK_AT_MRBL_SPRT_INIT)
	await AudioHandler.dialogue_player.finished
	close_event()
