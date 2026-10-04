extends Node2D

var current_room = Node2D
var current_room_complete = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_room = $ROOM_1
	$Player.global_position = $ROOM_1/SpawnPoint.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_room_1_body_entered(body: Node2D) -> void:
	if body != $Player or current_room.ennemy_count != 0:
		return

	current_room = $ROOM_2
	current_room_complete = false
	body.global_position = $ROOM_2/SpawnPoint_2.global_position

	$ROOM_1/Camera.enabled = false
	$ROOM_2/Camera.enabled = true
