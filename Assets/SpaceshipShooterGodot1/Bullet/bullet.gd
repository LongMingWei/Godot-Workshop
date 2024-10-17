extends Area2D

@export var speed = 800
@onready var scorelabel = $"../Score"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y -= speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		scorelabel.add_score()
		area.queue_free()
		queue_free()
