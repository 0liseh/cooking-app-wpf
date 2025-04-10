extends CharacterBody3D  # Inherit from the CharacterBody3D class for 3D character movement

var speed = 5.0  # Set the movement speed of the character
var health = 100  # Player health

# Preload the DamagePopup scene
@onready var DamagePopup = preload("res://DamagePopup.tscn")

func _ready():
	pass  # No initialization needed, so this function is left empty

func _process(_delta):
	# Reset velocity to zero at the start of each frame
	velocity = Vector3.ZERO

	# Handle movement input
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1  # Move right
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1  # Move left
	if Input.is_action_pressed("ui_up"):
		velocity.z -= 1  # Move forward
	if Input.is_action_pressed("ui_down"):
		velocity.z += 1  # Move backward

	# Normalize the velocity vector to ensure consistent speed and then scale it by speed
	velocity = velocity.normalized() * speed

	# Move the character using the move_and_slide function
	move_and_slide()

func take_damage(amount, damage_type="Normal"):
	health -= amount
	show_damage_popup(amount, damage_type)
	if health <= 0:
		die()

func die():
	print("Player is dead")
	queue_free()

func show_damage_popup(amount, damage_type):
	# Instance the DamagePopup scene
	var popup = DamagePopup.instantiate()
	popup.set_damage(amount, damage_type)
	add_child(popup)
