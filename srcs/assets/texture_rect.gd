@tool
extends TextureRect


@onready var backgrounds :Array[Texture2D] = [
	preload("res://srcs/assets/Free/Background/Blue.png"),
	preload("res://srcs/assets/Free/Background/Brown.png"),
	preload("res://srcs/assets/Free/Background/Gray.png")
]


func _ready() -> void:
	texture = backgrounds.pick_random()
