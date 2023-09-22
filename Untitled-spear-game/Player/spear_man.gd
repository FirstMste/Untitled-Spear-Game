extends CharacterBody2D

class_name Player


@onready var health_Lab = $CanvasLayer/Health
@onready var animation_player = $AnimationPlayer


signal HIT

var Has_Been_Hit:bool = false

var Health:int = 3

func _ready():
	health_Lab.text = str(Health)

func Health_Handle():
	if !Has_Been_Hit:
		Has_Been_Hit = true
		animation_player.play("Hit")
		emit_signal("HIT",Health)
		if Health > 0:
			Health -= 1
		else:
			Health = 3
		health_Lab.text = str(Health)


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Hit":
		Has_Been_Hit = false
