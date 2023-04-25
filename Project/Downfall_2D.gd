extends Area2D




func _on_Downfall_2D_body_entered(body):
	if body.has_method("DownFail"):
		 body.DownFail()
		 get_tree().change_scene('res://GameOverArea2D.tscn')
