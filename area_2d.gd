extends Area2D

@export var speed: float = 400.0
@export var damage: int = 1

var current_room: Node2D


func _physics_process(delta: float) -> void:
	global_position += Vector2.RIGHT.rotated(global_rotation) * speed * delta

	if current_room == null:
		return

	var camera: Camera2D = current_room.get_node("Camera2D")

	if global_position.distance_to(camera.global_position) > 1000:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
		queue_free()
