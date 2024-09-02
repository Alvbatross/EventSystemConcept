extends Node
class_name Event

signal event_started()
signal event_ended()

signal event_sound_done()

var event_name : String
var event_category : String
var oneshot : bool
var event_prerequisites : Array
var event_completion_flags : Array
var event_sound : String
var loop_sound : bool
var loop_interval : float


var prerequisites_done : bool = true
var is_ongoing : bool = false


func _ready() -> void:
	initialize_event()
	
	if event_category == "BGM":
		if event_name == EventHandler.current_bgm:
			queue_free()
			return
	elif oneshot:
		if (event_name + "_Done") in EventHandler.finished_events:
			queue_free()
			return
	
	event_started.connect(_on_event_started)
	event_ended.connect(get_parent()._on_event_ended)
	start_event()


func initialize_event() -> void:
	event_name = self.name
	if EventHandler.event_library.has(event_name):
		event_category = EventHandler.event_library[event_name]["Event_Category"]
		oneshot = EventHandler.event_library[event_name]["Oneshot"]
		event_prerequisites = EventHandler.event_library[event_name]["Event_Prerequisites"]
		event_completion_flags = EventHandler.event_library[event_name]["Event_Completion_Flags"]
		event_sound = EventHandler.event_library[event_name]["Event_Sound"]
		loop_sound = EventHandler.event_library[event_name]["Loop_Sound"]
		loop_interval = EventHandler.event_library[event_name]["Loop_Interval"]
	else:
		print("Event " + event_name + " Not Found")


func start_event() -> void:
	prerequisites_done = true
	for flag in event_prerequisites:
		if flag not in EventHandler.finished_events:
			prerequisites_done = false
			
	if not prerequisites_done:
		print("Event " + str(event_name) + " not Started")
	else:
		print("Event " + str(event_name) + " Started")
		is_ongoing = true
		emit_signal("event_started")


func close_event() -> void:
	for flag in event_completion_flags:
		EventHandler.finished_events.append(flag)
	queue_free()
	print(EventHandler.finished_events)
	await tree_exited
	emit_signal("event_ended")


func play_event_sound():
	if event_category == "BGM":
		EventHandler.current_bgm = event_name
		AudioHandler.play_bgm(event_sound)
		await AudioHandler.bgm_player.finished
	else:
		AudioHandler.play_dialogue(event_sound)
		await AudioHandler.dialogue_player.finished
		emit_signal("event_sound_done")
	
	if loop_sound:
		await get_tree().create_timer(loop_interval).timeout
		play_event_sound()


func _on_event_started():
	pass
