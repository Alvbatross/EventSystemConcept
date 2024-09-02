extends Event


func _on_event_started():
	play_event_sound()
	await event_sound_done
	close_event()
