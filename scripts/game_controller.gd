extends Node

@export var ball : RigidBody3D
@export var win_bar : HScrollBar
@export var cam : Camera3D

var ball_start_position

var score = 5

func player_scored(amt):
	score += amt
	win_bar.value = score * 10
	respawn_ball()
	
func respawn_ball():
	ball.global_position = ball_start_position
	ball.linear_velocity = Vector3(0,0,0)
	ball.angular_velocity = Vector3(0,0,0)
	ball.apply_impulse(Vector3(1,1,7))
	
	
	print(score)
	
	if score >= 10:
		print("okay")
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
	if score <= 0:
		print("okay")
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	
	
	pass

func _ready() -> void:
	ball_start_position = ball.global_position
	ball.apply_impulse(Vector3(1,1,7))
