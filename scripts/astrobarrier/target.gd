extends Area2D

var anim: PathFollowAnim

func _ready():
	anim = get_node("../PathFollowAnim") as PathFollowAnim
	area_entered.connect(on_area_entered)
	return

func on_area_entered(a: Area2D):
	var p = a.get_parent()
	
	if p.is_in_group("astro_barrier_bullet"):
		p.free()
		if anim and anim is PathFollowAnim:
			anim.animate = false
	return
