extends Node2D

@export
var pixels_per_second: float = 60
var area: Area2D

@export
var max_travel_distance = 256
var start_position: Vector2

func _ready():
	area = get_node("Area2D") as Area2D
	#area.area_entered.connect(on_area_entered)
	start_position = position
	return

#func on_area_entered(a: Area2D):
	#if a.is_in_group("astrobarrier_target"):
		#a.get_parent().free()
		#queue_free()
	#return

func _process(delta):
	position.y -= pixels_per_second * delta
	if position.distance_to(start_position) > max_travel_distance:
		queue_free()
	return
