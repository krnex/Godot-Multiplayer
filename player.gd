extends CharacterBody2D


const SPEED = 300.0

#
#func _enter_tree():
#	self.set_multiplayer_authority((name).to_int())
#	$MultiplayerSynchronizer.set_multiplayer_authority((name).to_int())

func _physics_process(delta):
	if !(name == str(multiplayer.get_unique_id())): return
		
	var left_right = Input.get_axis("ui_left", "ui_right")
	var up_down = Input.get_axis("ui_up", "ui_down")
	if left_right or up_down:
		velocity = Vector2(left_right, up_down) * SPEED 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func _process(delta):
	self.update_position.rpc(1, self.global_position)

@rpc("authority", "call_remote", "unreliable", 0)
func update_position(pos):
	self.global_position = pos
