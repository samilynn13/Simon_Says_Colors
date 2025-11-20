extends CanvasLayer

var max_Colors = 5
var color_ID = {
	"Red": 0, 
	"Yellow": 1, 
	"Blue": 2, 
	"Green": 3, 
	"Orange": 4, 
	"Purple": 5}

var circle_radius = 200
var x_center = 501
var y_center = 249

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(max_Colors):
		var button = Button.new()
		button.text = color_ID.find_key(i)
		button.size.x = 150
		button.size.y = 150
		button.position.x = x_center + circle_radius * -sin((2 * PI * i / max_Colors))
		button.position.y = y_center + circle_radius * -cos((2 * PI * i / max_Colors))
		#button.pressed.connect()
		add_child(button)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
