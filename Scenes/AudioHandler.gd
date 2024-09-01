extends Node

enum AudioKeys {
	OUTSIDE,
	INSIDE,
	LOOK_AT_MRBL_SPRT_INIT,
	LOOK_AT_MRBL_SPRT_CONTD,
	GATE_IS_LOCKED,
	PICK_UP_THE_KEY
}

@export var bgm_locations : Dictionary = {
	AudioKeys.OUTSIDE : preload("res://Assets/Sound/01 - Outside (Tutorial), Waterfall Area (B-2), On Boat (C-3) v1 Full Loopable.wav"),
	AudioKeys.INSIDE : preload("res://Assets/Sound/02 - Maintenance Workshop (A-1, C-4) v1 Full Loopable.wav")
}

@export var dialogue_locations : Dictionary = {
	AudioKeys.LOOK_AT_MRBL_SPRT_INIT : preload("res://Assets/Sound/VE_VO_ZT_MRBLSPRT_01_HelloMe.ogg"),
	AudioKeys.LOOK_AT_MRBL_SPRT_CONTD : preload("res://Assets/Sound/VE_VO_ZT_MRBLSPRT_02_HeyHere.ogg"),
	AudioKeys.GATE_IS_LOCKED : preload("res://Assets/Sound/VE_VO_ZT_MRBLSPRT_03_TheGateIsLocked.ogg"),
	AudioKeys.PICK_UP_THE_KEY : preload("res://Assets/Sound/VE_VO_ZT_MRBLSPRT_04_GoKey.ogg")
}

@onready var bgm_player := $BGMPlayer
@onready var dialogue_player := $DialoguePlayer

func play_bgm(bgm_key):
	bgm_player.stream = bgm_locations[bgm_key]
	bgm_player.play()

func play_dialogue(dialogue_key):
	dialogue_player.stream = dialogue_locations[dialogue_key]
	dialogue_player.play()


func _on_bgm_player_finished():
	bgm_player.playing = true
