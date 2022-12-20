extends Control


onready var _ui_message: TextEdit = $TextEdit
onready var _ui_creation_date: Label = $CreationDateLabel
onready var _ui_create_button: Button = $Buttons/CreateButton


func _ready() -> void:
    
    _ui_create_button.disabled = len(_ui_message.text) == 0


func _on_CancelButton_pressed() -> void:
    
    get_tree().change_scene("res://Main.tscn")


func _on_CreateButton_pressed() -> void:
    
    var task: Task = Task.new()
    
    task.create(_ui_message.text)
    G.tasks.append(task)
    G.save_db()
    
    get_tree().change_scene("res://Main.tscn")


func _on_TextEdit_text_changed() -> void:
    
    _ui_create_button.disabled = len(_ui_message.text) == 0
