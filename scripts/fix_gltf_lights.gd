@tool
extends Node3D

@export
var scene: Node

@export
var light_energy_max: float = 200.0

@export
var light_energy_scale_factor: float = 0.0002

func on_scene_child_entered_tree(node: Node):
	print("scene enter, fixing lights")
	fix_lights_in_node(node)
func on_tree_changed():
	print("tree changed, fixing lights")
	fix_lights()
	return

#func _ready():
	#fix_lights()
	#return
	
func walk_all_children(node: Node, cb: Callable):
	for child in node.get_children():
		cb.call(child)
		walk_all_children(child, cb)

func fix_light(l: Node):
	if l is Light3D:
		if l is SpotLight3D:
			if l.light_energy > light_energy_max:
				l.light_energy *= light_energy_scale_factor
		elif l is OmniLight3D:
			if l.light_energy > light_energy_max:
				l.light_energy *= light_energy_scale_factor
		elif l is DirectionalLight3D:
			if l.light_energy > light_energy_max:
				l.light_energy *= light_energy_scale_factor
	return

func fix_lights_in_node(node: Node):
	if not node == null:
		print("fix_gltf_lights")
		walk_all_children(node, fix_light)
	return

func fix_lights():
	return fix_lights_in_node(scene)

var has_init = false
@export
var fix_now = false

var listening_to_scene_add = false
func listen_to_scene_add():
	#get_tree().tree_changed.connect(on_tree_changed)
	if scene == null:
		return
	if not listening_to_scene_add:
		scene.child_entered_tree.connect(on_scene_child_entered_tree)
		listening_to_scene_add = true
	return

func _process(delta):
	if scene == null:
		scene = get_tree().current_scene
		listen_to_scene_add()
	if (fix_now or not has_init) and not scene == null:
		listen_to_scene_add()
		fix_now = false
		has_init = true
		fix_lights()
	return
