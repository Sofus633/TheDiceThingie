extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.global_position = $ROOM_1/SpawnPoint.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_room_1_body_entered(body: Node2D) -> void:
	if body != $Player:
		return

	body.global_position = $ROOM_2/SpawnPoint_2.global_position

	$ROOM_1/CAM_1.enabled = false
	$ROOM_2/CAM_2.enabled = true
