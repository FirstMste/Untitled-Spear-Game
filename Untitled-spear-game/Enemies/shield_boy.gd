extends CharacterBody2D

class_name Shield_Boy

@onready var floor_check_left = $FLoorCheckLeft
@onready var floor_check_right = $FLoorCheckright
@onready var wall_checkright = $wallCheckright
@onready var wall_check_left = $WallCheckLeft


@export var Speed:float = 150
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var Health:int = 1

enum Start_Direction {
	Left,
	Right
}

@export var Direction:Start_Direction = Start_Direction.Left

func _ready():
	match Direction:
		Start_Direction.Left: velocity = Vector2.LEFT
		Start_Direction.Right: velocity = Vector2.RIGHT

func _physics_process(delta):
	var ledge_Check = !floor_check_left.is_colliding() or !floor_check_right.is_colliding() or wall_checkright.is_colliding() or wall_check_left.is_colliding()
	Ledge_Check(ledge_Check)
	
	
	
	velocity.x = velocity.normalized().x * Speed
	
	move_and_slide()

func Ledge_Check(LC):
	if LC:
		velocity.x = velocity.x * -1
