extends Area2D

@export_file("*.tscn") var target_scene: String

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Main charater" or body.name == "player":
		if target_scene:
			get_tree().change_scene_to_file(target_scene)
