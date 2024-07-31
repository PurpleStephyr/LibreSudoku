#
# Copyright 2024 Steph Kraemer <purple.stephyr@proton.me>
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
signal selected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func unselect():
	print("Unselecting ", self)
	$Sprite2D.texture = load("res://art/cell_unselected.png")


func select():
	print("Selecting ", self)
	$Sprite2D.texture = load("res://art/cell_selected.png")


func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("mouse_left_click"):
		print("Clicked")
		clicked.emit(self)
