extends Node

@export var action : String
@export var show_shape : Sprite3D
@export var shapeCast : ShapeCast3D

var rng = RandomNumberGenerator.new()

signal hit_complete


func _process(delta: float) -> void:
	if shapeCast.get_collision_count() > 0:
		if Input.is_action_just_pressed(action):
			hit_ball(shapeCast.get_collider(0))
		
		pass

func hit_ball(ball):
	ball.linear_velocity = Vector3(0,0,0)
	var offset = Vector3(rng.randf_range(-.4,.4), rng.randf_range(-.2,.2), 0)
	ball.apply_impulse( (-self.global_transform.basis.z + offset)  * 34)
	hit_complete.emit()
	ball.player_hit = true
	
func _on_body_entered(body: Node3D) -> void:
	show_shape.visible = true
	pass # Replace with function body.

func _on_body_exited(body: Node3D) -> void:
	show_shape.visible = false
	pass # Replace with function body.
