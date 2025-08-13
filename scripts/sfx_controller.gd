extends Node

var sound_node

func _ready():
	sound_node = get_node("/root/Chimenis/Sounds")

func play_sound(sound_name):
	
	if(sound_node):
		var sound = sound_node.get_node(sound_name)
		print(sound)
		sound.play()
		
func play_sound_random_pitch(sound_name):
	if(sound_node):
		var sound = sound_node.get_node(sound_name)
		sound.pitch_scale = randf_range(.5, 1.5)
		sound.play()
