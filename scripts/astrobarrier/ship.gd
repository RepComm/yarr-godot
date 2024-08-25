extends Node2D

@export
var min_x = -110
@export
var max_x = 110

@export
var travel_speed = 100

@export
var bullet_parent: Node2D
@export
var bullet_prefab: PackedScene

func _ready():
	return
func _process(delta):
	if Input.is_action_pressed("ui_left") and global_position.x > min_x:
		global_position.x -= travel_speed * delta
	elif Input.is_action_pressed("ui_right") and global_position.x < max_x:
		global_position.x += travel_speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		if bullet_prefab != null and bullet_parent != null:
			var b = bullet_prefab.instantiate() as Node2D
			bullet_parent.add_child(b)
			b.global_position = global_position
	return
