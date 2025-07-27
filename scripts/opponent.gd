extends CharacterBody3D

@export var ball : RigidBody3D
@export var speed = 1.0

func _process(delta: float) -> void:
	
	if(ball.player_hit):
		
		var targPos = ball.position
		var target_vector = global_position.direction_to(ball.global_position)
		
		look_at(ball.position, Vector3.UP)
		self.rotation = Vector3(0, self.rotation.y, 0)

		
		var dir = targPos -  self.position 
		dir.y = 0
		if(in_walkable_region(ball.position)):
			self.velocity = dir * speed
			self.move_and_slide()

func in_walkable_region(pos):
	var dest_position = self.position + pos
	return dest_position.x > -13 and dest_position.x < 30 and dest_position.z > -30 and dest_position.z < -4.5
