extends CharacterBody2D

@export var SPEED = 300.0
@export var hp = 3

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	var hplabel = $"../PlayerHp"
	hplabel.text = "Player HP: " + str(hp)

func _physics_process(delta):
	# Handle shooting
	if Input.is_action_just_pressed("fire"):
		spawn_bullet()

	# Get the input direction and handle movement
	var direction = Input.get_vector("moveleft", "moveright", "moveup", "movedown")
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED

	move_and_slide()

	# Clamp position to the screen bounds
	var view = get_viewport_rect().size / 2
	var camera_node = get_node("../Camera2D")
	var camera_pos = camera_node.global_position
	global_position.x = clamp(global_position.x, camera_pos.x - view.x, camera_pos.x + view.x)
	global_position.y = clamp(global_position.y, camera_pos.y - view.y, camera_pos.y + view.y)

	# Handle animation
	if velocity.x < 0:
		$AnimatedSprite2D.play("left")
	elif velocity.x > 0:
		$AnimatedSprite2D.play("right")
	else:
		$AnimatedSprite2D.play("default")  

func spawn_bullet():
	var scene_to_spawn = preload("res://Assets/SpaceshipShooterGodot1/Bullet/bullet.tscn")
	var new_scene_instance = scene_to_spawn.instantiate()
	get_tree().current_scene.add_child(new_scene_instance)
	new_scene_instance.global_position = global_position

func player_hit():
	hp -= 1
	var hplabel = $"../PlayerHp"
	hplabel.text = "Player HP: " + str(hp)
	if hp <= 0:
		die()

func die():
	print("Player has died.")
	queue_free()  # Remove the player or reset the game
