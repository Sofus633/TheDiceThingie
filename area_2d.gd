extends Area2D

@export var speed: float = 400.0
@export var damage: int = 1


func _physics_process(delta: float) -> void:
	position += Vector2.RIGHT.rotated(rotation) * speed * delta
	if not get_viewport_rect().has_point(global_position):
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free()
