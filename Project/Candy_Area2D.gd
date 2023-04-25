extends Area2D
signal my_signal
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

#func _on_Area2D_body_entered(body):
#	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	emit_signal("my_signal")
	if body.has_method("GetCandy"):
		body.GetCandy()
		queue_free()
		
		
		
