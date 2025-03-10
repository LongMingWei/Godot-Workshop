extends Area2D

var rng = RandomNumberGenerator.new()

func _ready():
	# Start the timer
	$Timer.start()

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy():
	# Load the enemy scene
	var EnemyScene = preload("res://Assets/Premade/Enemies/enemy_ship_small.tscn")
	# Instance the enemy
	var enemy_instance = EnemyScene.instantiate()
	# Add the enemy to the scene
	add_child(enemy_instance)
	# Set the position where you want the enemy to spawn
	enemy_instance.global_position = global_position + Vector2(rng.randf_range(-1, 1) * 300, -100)

	
