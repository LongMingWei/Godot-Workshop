extends Area2D

signal body_enter

func _ready() -> void:
	connect("body_enter", _on_body_entered)

func _on_body_entered(body: Node) -> void:
	emit_signal("body_enter", body)
