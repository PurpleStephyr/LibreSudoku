#
# Copyright 2024 Steph Kraemer <purple.stephyr@fmgirl.com>
#
# This file is part of LibreSudoku.
#
# LibreSudoku is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# LibreSudoku is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with 
# LibreSudoku. If not, see <https://www.gnu.org/licenses/>. 

extends Area2D

signal clicked
signal value_changed

var selected = false
var value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_value(val):
	value = val
	$Label.text = str(val)
	value_changed.emit(self)


func check_conflict(other):
	if other == self:
		return
	if other.value == self.value:
		print("Conflict ", self, " and ", other)

func _input(event):
	if selected:
		if event.is_action_pressed("type_1"):
			set_value(1)
		elif event.is_action_pressed("type_2"):
			set_value(2)
		elif event.is_action_pressed("type_3"):
			set_value(3)
		elif event.is_action_pressed("type_4"):
			set_value(4)
		elif event.is_action_pressed("type_5"):
			set_value(5)
		elif event.is_action_pressed("type_6"):
			set_value(6)
		elif event.is_action_pressed("type_7"):
			set_value(7)
		elif event.is_action_pressed("type_8"):
			set_value(8)
		elif event.is_action_pressed("type_9"):
			set_value(9)


func unselect():
	print("Unselecting ", self)
	$Sprite2D.texture = load("res://art/cell_unselected.png")
	selected = false


func select():
	print("Selecting ", self)
	$Sprite2D.texture = load("res://art/cell_selected.png")
	selected = true


func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("mouse_left_click"):
		print("Clicked")
		clicked.emit(self)
