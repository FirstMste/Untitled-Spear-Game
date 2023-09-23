extends Area2D

signal Check_Reached
@onready var collision_shape_2d = $CollisionShape2D

var SpawnPoint:Vector2

func _ready():
	SpawnPoint = self.global_position



func _on_body_entered(body):
	if body is Player:
		emit_signal("Check_Reached",SpawnPoint)
