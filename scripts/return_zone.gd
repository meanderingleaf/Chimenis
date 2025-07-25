extends Node

var target_points = []

func _ready() -> void:
	target_points = get_tree().get_nodes_in_group("hit_point")

func _on_body_entered(body: Node3D) -> void:
	
	if( randf() < .5):
		#select a random point from the targ points
		var a_point = target_points.pick_random()
		var hit_dir = a_point.global_position-  body.global_position
		
		body.linear_velocity = Vector3(0,0,0)
		var return_vec = hit_dir.normalized()
		return_vec.y -= .2
		body.apply_impulse( return_vec * 30)
		
		body.player_hit = false
