extends Node2D


@onready var to_level1_button = $CanvasLayer/ToLevel1Button
@onready var to_level3_button = $CanvasLayer/ToLevel3Button

# Called when the node enters the scene tree for the first time.
func _ready():
	to_level1_button.pressed.connect(get_parent()._on_change_level.bind("Level1"))
	to_level3_button.pressed.connect(get_parent()._on_change_level.bind("Level3"))


