extends Node

@export var shake_strength = 2.3
@export var shake_fade = .2

var rng = RandomNumberGenerator.new()
var initial_transform = self.transform 
var cur_shake = 0.0

func shake():
	cur_shake = shake_strength
	pass
	
func randomOffset():
	return Vector3(rng.randf_range(-cur_shake,cur_shake), rng.randf_range(-cur_shake,cur_shake), 0 )

func _process(delta: float) -> void:
	if(cur_shake > 0):
		print(cur_shake)
		cur_shake = lerpf(cur_shake, 0, shake_fade + delta)
		
		self.transform.origin = initial_transform.origin + randomOffset()
	else:
		self.transform.origin = initial_transform.origin

func _on_hit_zone_2_hit_complete() -> void:
	self.shake()
	pass # Replace with function body.


func _on_hit_zone2_hit_complete() -> void:
	self.shake()
	pass # Replace with function body.
