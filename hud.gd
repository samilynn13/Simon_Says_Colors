extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$MessageLabel.text = "Simon Says\nColors"
	$MessageLabel.show()
	await get_tree().create_timer(1).timeout
	$StartButton.show()

func _on_start_button_pressed() -> void:
	$StartButton.hide()
	await $MessageLabel.timeout
	start_game.emit()

func _on_message_timer_timeout() -> void:
	$MessageLabel.hide()

# variable related to the colored buttons
var min_Colors = 3
var max_Colors = 6
var color_ID = {
	"Red": 0, 
	"Yellow": 1, 
	"Blue": 2, 
	"Green": 3, 
	"Orange": 4, 
	"Purple": 5}

# variable related to the circle that the buttons are placed on (in pixels)
var circle_radius = 200
var x_center = 501
var y_center = 249

func create_color_buttons():
	# creates the buttons via code and places them in a circular pattern equidistant to each other
	for i in range(min_Colors):
		var button = Button.new()
		button.text = color_ID.find_key(i)
		button.size.x = 150
		button.size.y = 150
		''' the sine and cosine were switched between these two formulas and given (-)
		this was to position the first button at the 12 o'clock position rather 
		than the three o'clock position '''
		button.position.x = x_center + circle_radius * -sin((2 * PI * i / min_Colors))
		button.position.y = y_center + circle_radius * -cos((2 * PI * i / min_Colors))
		add_child(button)
