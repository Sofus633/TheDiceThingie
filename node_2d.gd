extends Node2D

var current_room = Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_room = $ROOM_1
	$Player.global_position = $ROOM_1/SpawnPoint.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_room_1_body_entered(body: Node2D) -> void:
	if body != $Player:
		return

	current_room = $ROOM_2
	body.global_position = $ROOM_2/SpawnPoint_2.global_position

	$ROOM_1/CAM_1.enabled = false
	$ROOM_2/CAM_2.enabled = true
