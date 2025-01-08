extends TextureProgressBar

@onready var player:= get_node("../../MainCharacter/CharacterBody2D")

func _ready() -> void:
	player.health_changed.connect(update_health_bar)
	update_health_bar()

func update_health_bar():
	value = player.current_health * 100 / player.player_health
