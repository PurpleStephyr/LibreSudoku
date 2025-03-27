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

extends TileMap

signal clicked

var current_selected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_cell_clicked(cell):
	print("cell ", cell, " clicked")
	clicked.emit(self)
	if current_selected != cell:
		cell.select()
		current_selected = cell
	else:
		current_selected = null


func _on_cell_value_changed(cell):
	print("cell ", cell, " value changed")
	get_tree().call_group("Cells", "check_conflict", cell)

func unselect():
	print("unselecting ", self)
	if current_selected != null:
		current_selected.unselect()
