extends Node

var current_bgm

var event_library : Dictionary = {}

var finished_events : Array = []

func _ready():
	event_library = load_data("res://Assets/Json/EventLibrary.json")
	print(event_library)

func load_data(file_location: String) -> Dictionary:
	var output_dictionary : Dictionary = {}
	
	var json_as_text = FileAccess.get_file_as_string(file_location)
	var json_as_array = JSON.parse_string(json_as_text)
	
	for key in json_as_array:
		output_dictionary[key["Event_Name"]] = {
			"Event_Category" : key["Event_Category"],
			"Oneshot" : key["Oneshot"],
			"Event_Prerequisites" : key["Event_Prerequisites"]
		}
	return output_dictionary
	
