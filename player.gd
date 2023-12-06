extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _enter_tree():
	print("name", name)
	set_multiplayer_authority(name.to_int())

func _physics_process(delta):
	if !is_multiplayer_authority():
		if name != "1":
			print(name, " Am not authority. ", get_multiplayer_authority(), name.to_int() == get_multiplayer_authority(), " ", multiplayer.get_unique_id())
		return
	
	var direction = Input.get_axis("ui_left", "ui_right")
	var up_down = Input.get_axis("ui_up", "ui_down")
	if direction or up_down:
		velocity = Vector2(direction, up_down) * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
