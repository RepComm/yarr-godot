extends RigidBody3D

@export
var horizontal_speed: Vector3 = Vector3(2.5, 0, 0)

@export
var vertical_speed: Vector3 = Vector3(0, 4, 0)

@export
var surface_force: Vector3 = Vector3(0,-9.8,0)

var motor_force: Vector3 = Vector3(0,0,0)

func _ready():
	
	return

func _physics_process(delta):
	apply_central_force(motor_force)
	return

func _process(delta):
	motor_force.x = 0
	motor_force.y = 0
	motor_force.z = 0
	
	if Input.is_action_pressed("aquagrabber_left"):
		motor_force -= horizontal_speed
	elif Input.is_action_pressed("aquagrabber_right"):
		motor_force += horizontal_speed
	
	if global_position.y > 0:
		motor_force += surface_force
	else:
		if Input.is_action_pressed("aquagrabber_up"):
			motor_force += vertical_speed
		elif Input.is_action_pressed("aquagrabber_down"):
			motor_force -= vertical_speed
	
	return
