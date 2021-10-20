extends Area2D

export var InitialPosition = Vector2(512,526)
export var InitialDirection = -45
export var Velocity =400
var hitOnCycle = 0
var moving = false
var Direction = InitialDirection
var center

func resetPosition():
	moving = false
	position = InitialPosition
	Direction = InitialDirection 
	randomize()
	if randf() > 0.5:
		Direction -= 90

func _ready():
	resetPosition()
	self.position.x = get_viewport_rect().size.x/2

	center = get_viewport_rect().size/2;
	get_viewport().warp_mouse(center)

	set_physics_process(true)
	
func _physics_process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		moving = true
	var x = cos(deg2rad(Direction))
	var y = sin(deg2rad(Direction))
	if moving:
		var newPos = Vector2(x,y) * Velocity * delta
		position.x += newPos.x
		position.y += newPos.y
	else:
		position.x = $"../Player".position.x
	hitOnCycle = 0
	


func _on_Pelota_body_entered(body):
	var x = cos(deg2rad(Direction))
	var y = sin(deg2rad(Direction))
	
	var cellPos = body.world_to_map(position*4)
	if (cellPos.y <=1 || cellPos.y >= 20):
		y*=-1 
	if (cellPos.x <=1 || cellPos.x >= 30):
		x*=-1 
	Direction= rad2deg(atan2(y,x))
	
	if (cellPos.y >=17):
		resetPosition()

func _on_Pelota_area_entered(area):
	var x = cos(deg2rad(Direction))
	var y = sin(deg2rad(Direction))
	if area.name == 'Player':
		y*=-1 
		Direction= rad2deg(atan2(y,x))
	if area.is_in_group("blocks"):
		if hitOnCycle == 0:
			area.hit()
			var angleToBlock = get_angle_to(area.position)
			
			if abs(cos(angleToBlock))> abs(sin(angleToBlock)):
				x *= -1
			else:
				y *= -1
			Direction = rad2deg(atan2(y,x))
		
		hitOnCycle += 1
