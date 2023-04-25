extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DoorArea2D_body_entered(body):
	if body.has_method("PassDoor"):
		 body.PassDoor()
		 get_tree().change_scene('res://CompletedNode2D.tscn')
