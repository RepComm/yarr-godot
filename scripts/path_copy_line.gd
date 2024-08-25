@tool
extends Path2D

var parentAsLine2D: Line2D

func _ready():
	var p = get_parent()
	if p is Line2D:
		parentAsLine2D = p
	
	if parentAsLine2D != null:
		if parentAsLine2D.points.size() > 0:
			curve.clear_points()
			for pt in parentAsLine2D.points:
				curve.add_point(pt)
			if parentAsLine2D.closed:
				curve.add_point(parentAsLine2D.points[0])
	return
