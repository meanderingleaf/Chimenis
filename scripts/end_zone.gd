extends Area3D

@export var score_amount = 1

func _on_body_entered(body: Node3D) -> void:
	get_node("/root/Chimenis").player_scored(score_amount)
	body.player_hit = false
	pass # Replace with function body.
