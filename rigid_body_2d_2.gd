extends RigidBody2D

var health = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.linear_velocity.x =- 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if health <= 0:
		queue_free()

func take_damage(damage: int) -> void:
	health -= damage
