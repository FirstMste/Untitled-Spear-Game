extends Node2D


var SpearMan

var Jump_Force = -400

var Speed:float = 300
var Accel:float = 15 # Time to Start moving.
var Friction:float = 15 # Time to stop.

var Jump_Buffer:int = 0
var Jump_Buffer_Time:int = 15 # frames that jump can be pressed before hitting floor and still work

var Cayote_Jump_Buffer:int = 0
var Cayote_Jump_Time:int = 15 # frames that jump will still work after leaving the floor

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # default project gravity set to -980 

func Apply_Gravity(delta):
	SpearMan.velocity.y += gravity * delta

func Cayote_Handle():
	if SpearMan.is_on_floor():
		Cayote_Jump_Buffer = Cayote_Jump_Time
	else:
		Cayote_Jump_Buffer -= 1

func Jump_Buffer_Handle():
	if Input.is_action_just_pressed("Jump"):
		Jump_Buffer = Jump_Buffer_Time
	if Jump_Buffer > 0:
		Jump_Buffer -= 1

func Movement():
	var Direction = Input.get_axis("MoveLeft","MoveRight")
	
	if Direction != 0:
		SpearMan.velocity.x = move_toward(SpearMan.velocity.x, Speed * Direction, Accel)
	else:
		SpearMan.velocity.x = move_toward(SpearMan.velocity.x, 0 ,Friction)

func Jump():
	if Jump_Buffer > 0 and Cayote_Jump_Buffer > 0:
		SpearMan.velocity.y = Jump_Force
		Jump_Buffer = 0
		Cayote_Jump_Buffer = 0

func _physics_process(delta):
	SpearMan = get_parent() 
	if !SpearMan.is_on_floor():
		Apply_Gravity(delta)
	
	Cayote_Handle()
	Jump_Buffer_Handle()
	Movement()
	Jump()
	
	SpearMan.move_and_slide()
