extends Control


func _on_try_again_pressed():
	GlobalVariables.respawn()
	GlobalVariables.startGame()


func _on_quit_pressed():
	get_tree().quit()
