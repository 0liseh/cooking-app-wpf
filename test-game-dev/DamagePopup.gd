extends Label3D

@export var float_speed: float = 2.0
@export var duration: float = 1.5
var timer: float = 0

func _ready():
	set_process(true)

func set_damage(amount: float, damage_type: String):
	text = str(amount) + " " + damage_type
	modulate = Color.RED  # Example: red color for damage numbers

func _process(delta: float):
	timer += delta
	if timer > duration:
		queue_free()
	else:
		position.y += float_speed * delta  # Floating effect using position
