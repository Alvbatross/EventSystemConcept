extends Event


func _on_event_started():
	EventHandler.current_bgm = event_name
	AudioHandler.play_bgm(AudioHandler.AudioKeys.INSIDE)
