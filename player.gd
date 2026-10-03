extends CharacterBody2D


const SPEED = 300.0
const ACCELERATION := 2000.0
const FRICTION := 1500.0
const MUZZLE_OFFSET := 20.0

@export var bullet: PackedScene
@export var fire_cooldown: float = 0.25
@export var max_health: int = 5

var health: int
var cooldown_left: float = 0.0


func _ready() -> void:
	health = max_health


func _physics_process(delta: float) -> void:
	cooldown_left = maxf(cooldown_left - delta, 0.0)

	var input := Input.get_vector("left", "right", "up", "down")
	var target := input * SPEED
	if input == Vector2.ZERO:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	else:
		velocity = velocity.move_toward(target, ACCELERATION * delta)

	if Input.is_action_pressed("shoot") and cooldown_left <= 0.0:
		shoot()

	move_and_slide()


func aim_direction() -> Vector2:
	return (get_global_mouse_position() - global_position).normalized()


func muzzle_position() -> Vector2:
	return global_position + aim_direction() * MUZZLE_OFFSET


func shoot() -> void:
	if bullet == null:
		return
	var b := bullet.instantiate()
	var sprite := Sprite2D.new()
	sprite.name = "Projectile"
	sprite.texture = load("res://sprites/Désprite_ph.png")
	b.add_child(sprite)
	get_parent().current_room.add_child(b)
	b.top_level = true
	b.global_position = muzzle_position()
	b.global_rotation = aim_direction().angle()
	cooldown_left = fire_cooldown
