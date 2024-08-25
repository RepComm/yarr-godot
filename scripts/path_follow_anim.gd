@tool
extends Node2D

class_name PathFollowAnim

var parentAsPathFollow2D: PathFollow2D

@export
var pixels_per_second: float = 20
var direction = true
@export
var animate = true

func _ready():
	var p = get_parent()
	if p is PathFollow2D:
		parentAsPathFollow2D = p
	return

func _process(delta):
	if not animate:
		return
	if parentAsPathFollow2D != null:
		if parentAsPathFollow2D.progress_ratio > 0.99:
			direction = false
		elif parentAsPathFollow2D.progress_ratio < 0.01:
			direction = true
		if direction:
			parentAsPathFollow2D.progress += pixels_per_second * delta
		else:
			parentAsPathFollow2D.progress -= pixels_per_second * delta
	return
