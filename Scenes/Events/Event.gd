extends Node
class_name Event

signal event_started()
signal event_ended()

var event_category : String
var event_name : String
var event_prerequisites : Array
@export var oneshot : bool

var prerequisites_done : bool = true
var is_ongoing : bool = false


func _ready() -> void:
	initialize_event()
	
	if event_category == "BGM":
		if event_name == EventHandler.current_bgm:
			queue_free()
			return
	elif oneshot:
		if event_name in EventHandler.finished_events:
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
	EventHandler.finished_events.append(event_name)
	queue_free()
	print(EventHandler.finished_events)
	await tree_exited
	emit_signal("event_ended")
	

func _on_event_started():
	pass
