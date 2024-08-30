extends Node
class_name Event

signal event_started()
signal event_ended()

@export var event_category : EventUtils.EventCategory
@export var event_name : EventUtils.Events
@export var event_prerequisites : Array[EventUtils.Events]
@export var oneshot : bool

var prerequisites_done : bool = true
var is_ongoing : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if event_category == EventUtils.EventCategory.BGM:
		if event_name == EventHandler.current_bgm:
			queue_free()
		else:
			initialize_event()
	elif oneshot:
		if event_name in EventHandler.finished_events:
			queue_free()
		else:
			initialize_event()
	else:
		initialize_event()


func initialize_event() -> void:
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
	
