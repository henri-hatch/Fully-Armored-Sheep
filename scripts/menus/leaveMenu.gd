extends Control


func _on_yes_pressed():
	GlobalVariables.confirmLeave.emit()
	print("leave menu confirmed")


func _on_no_pressed():
	GlobalVariables.leaveMenuClosed.emit()
	print("leave menu closed")
