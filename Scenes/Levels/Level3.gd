extends Node2D


@onready var to_level2_button = $CanvasLayer/ToLevel2Button

# Called when the node enters the scene tree for the first time.
func _ready():
	to_level2_button.pressed.connect(get_parent()._on_change_level.bind("Level2"))


