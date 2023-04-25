extends Area2D
signal signal_bomb

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bomb

# Called when the node enters the scene tree for the first time.
func _ready():
#	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	emit_signal("signal_bomb")
	if body.has_method("hurt"): #เรียกตัวแปรครั้งแรก
		body.hurt()
		queue_free()
		


#func _process(delta):
	#bomb = global.random_rate
#	if bomb == 199:
#		var bomb_power = bomb.instance()
#		bomb_power.set_name("bomb(Clone)")
#		get_node(".").add_child(bomb_power)
#pass


