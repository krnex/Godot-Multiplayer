extends Node2D



func _ready():
	# Preconfigure game.

	Lobby.player_loaded.rpc_id(1) # Tell the server that this peer has loaded.

# Called only on the server.
func start_game():
	# All peers are ready to receive RPCs in this scene.
	pass

func _on_create_pressed():
	var err = Lobby.create_game()
	print(err if err else "Created Game")

func _on_join_pressed():
	var err = Lobby.join_game()
	print(err if err else "Joined Game")

func _on_start_pressed():
	if multiplayer.is_server():
		Lobby.load_game.rpc("res://test_game.tscn")
	else:
		print("Connot launch game. Not host.")
