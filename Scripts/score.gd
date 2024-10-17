extends Label

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = "Score: " + str(score)


func add_score():
	score += 1
	self.text = "Score: " + str(score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
