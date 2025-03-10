extends Node2D

@onready var player = $"../../Player"
@export var speed = 800

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_instance_valid(player):
		Engine.time_scale = 0;
		return;
	global_position.y += speed * delta

# This function is called when another body enters the area
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player.player_hit()
		queue_free()  # Removes the area from the scene
		
func _on_visible_on_screen_notifier_2d_screen_exited():
	if player != null:
		player.player_hit()
		queue_free()
