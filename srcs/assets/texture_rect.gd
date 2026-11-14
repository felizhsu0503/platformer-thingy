@tool
extends TextureRect


@onready var backgrounds :Array[Texture2D] = [
	preload("res://srcs/assets/Free/Background/Blue.png"),
	preload("res://srcs/assets/Free/Background/Brown.png"),
	preload("res://srcs/assets/Free/Background/Gray.png"),
	preload("res://srcs/assets/Free/Background/Green.png"),
	preload("res://srcs/assets/Free/Background/Yellow.png"),
	preload("res://srcs/assets/Free/Background/Pink.png")


]


func _ready() -> void:
	texture = backgrounds.pick_random()
