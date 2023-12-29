extends Node2D



signal end_tutorial




func _on_end_tutorial_body_entered(_body):
	emit_signal("end_tutorial")
	$EndTutorial/CollisionShape2D.set_deferred("disabled", true)
	$EndTutorial.set_deferred("monitoring", false)
	$EndTutorial.set_deferred("monitorable", false)
