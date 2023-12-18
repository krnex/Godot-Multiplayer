extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for _player in Lobby.players:
		var new_player = load($MultiplayerSpawner.get_spawnable_scene(0)).instantiate()
		new_player.name = str(_player)
		self.add_child(new_player, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
