extends CharacterBody3D

var speed = 2.0
var target = null

func _ready():
	target = get_parent().get_node("Player1")  # Correct reference to Player1

func _process(_delta):
	if target and is_instance_valid(target):  # Correct usage of is_instance_valid()
		# Calculate the direction towards the player
		var direction = (target.global_transform.origin - global_transform.origin).normalized()
		
		# Update the velocity based on the direction and speed
		velocity = direction * speed

		# Move the character towards the player
		move_and_slide()

		# Check for collision with the player
		if is_colliding_with_player():
			target.take_damage(10, "Physical")  # Deal 10 points of physical damage

func is_colliding_with_player() -> bool:
	var space_state = get_world_3d().direct_space_state

	# Define a ray query to check for collisions
	var query = PhysicsRayQueryParameters3D.create(global_transform.origin, global_transform.origin + velocity.normalized() * 1.0)
	query.exclude = [self]

	var result = space_state.intersect_ray(query)
	if result and result.collider is CharacterBody3D and result.collider.name == "Player1":
		return true
	return false
