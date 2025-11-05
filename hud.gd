extends CanvasLayer

var color_num = 3 #number of colors on screen
var color_list_length = 0 #number of colors that Simon will say
var color_list
func _on_start_button_pressed():
	color_list_length += 1 #increase list length by one every time button is pressed
	color_list = [] #Clear list from previous button press
	for i in color_list_length:
		var rng = randi() % color_num #random number between 0 and (color_num - 1)
		color_list.append(rng)
	print(color_list)

# Reset game to default start
func _on_reset_button_pressed():
	color_num = 3
	color_list_length = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
