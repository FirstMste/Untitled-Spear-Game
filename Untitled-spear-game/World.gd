extends Node2D

@onready var spear_man = $SpearMan

var Last_CheckPoint:Vector2
var Start_Point:Vector2

func _ready():
	Last_CheckPoint = spear_man.global_position
	Start_Point = spear_man.global_position
	spear_man.connect("HIT",Callable(self,"Respawn"),spear_man.Health)
	
	Connect_CheckPoints()


func Connect_CheckPoints():
	# get all checkpoints and connect them to the Respawn function.
	var All_CheckPoints = get_tree().get_nodes_in_group("CheckPoints")
	
	for Checks in All_CheckPoints:
		Checks.connect("Check_Reached",Callable(self,"Set_New_Spawn"))

func Respawn(Health):
	if Health > 0:
		spear_man.global_position = Last_CheckPoint
	else:
		Last_CheckPoint = Start_Point
		spear_man.global_position = Start_Point

func Set_New_Spawn(SpawnPoint:Vector2):
	Last_CheckPoint = SpawnPoint
