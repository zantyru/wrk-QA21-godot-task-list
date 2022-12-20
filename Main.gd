extends Control


onready var _ui_task_list = $ScrollContainer/VBoxContainer
var _tasks: Array = []


func _on_Button_pressed() -> void:
    
    var task: Task = Task.new()
    
    task.create("Доработать функциональность программы")
    _tasks.append(task)
    
    var ui_task: UI_TaskListItem = UI_TaskListItem.instantiate()
    ui_task.set_data(task)
    
    _ui_task_list.add_child(ui_task)
