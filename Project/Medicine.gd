extends Area2D


func _on_Medicine_body_entered(body):
	if body.has_method("heal"):
		body.heal()
		queue_free()
