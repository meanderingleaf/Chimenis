extends CharacterBody3D

@export var ball : RigidBody3D
@export var speed = 1.0

func _process(delta: float) -> void:
	
	if(ball.player_hit):
		var targPos = ball.position
		var dir = targPos -  self.position 
		self.velocity = dir * speed
		self.velocity.y = 0
		
		self.move_and_slide()
		pass
