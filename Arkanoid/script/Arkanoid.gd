extends Area2D

var oldPosition  = Vector2()
var center
export var velocity =500

func _ready():
	#paddle initial pos
	self.position.x = get_viewport_rect().size.x/2

	center = get_viewport_rect().size/2;
	get_viewport().warp_mouse(center)

	set_physics_process(true)


func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	if get_overlapping_bodies().size() == 0:
		var mouse_pos = get_viewport().get_mouse_position()
		var size = get_viewport_rect().size
		position.x = clamp(mouse_pos.x,0+82,size.x-82) 
		
	
	
	
"""
func _on_Player_body_entered(body):
	position = oldPosition
"""
