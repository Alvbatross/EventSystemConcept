extends Event


func _on_event_started():
	AudioHandler.play_dialogue(AudioHandler.AudioKeys.GATE_IS_LOCKED)
	await AudioHandler.dialogue_player.finished
	close_event()
