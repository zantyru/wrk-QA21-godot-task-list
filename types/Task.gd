extends Reference
class_name Task


var message: String = ""
var creation_date_string: String = ""
var creation_year: int = 0
var creation_month: int = 0
var creation_day: int = 0


func create(new_message: String) -> void:
    
    var date := Time.get_date_dict_from_system()
    
    message = new_message
    creation_year = date.year
    creation_month = date.month
    creation_day = date.day
    creation_date_string = Time.get_date_string_from_system()


func serialize_to_json() -> String:
    
    return JSON.print({
        "message": message,
        "creation_year": creation_year,
        "creation_month": creation_month,
        "creation_day": creation_day,
    })


func deserialize_from_json(json: String) -> bool:
    
    var json_parse_result: JSONParseResult = JSON.parse(json)
    var is_parsing_completed = json_parse_result.error == OK
    
    if is_parsing_completed:
        
        var dict: Dictionary = json_parse_result.result as Dictionary
        is_parsing_completed = dict.has_all([
            "message", "creation_year", "creation_month", "creation_day"
        ])
        
        if is_parsing_completed:
            
            message = dict.message
            creation_year = dict.creation_year
            creation_month = dict.creation_month
            creation_day = dict.creation_day
            
            var datetime_string: String = Time.get_datetime_string_from_datetime_dict({
                "year": creation_year,
                "month": creation_month,
                "day": creation_day,
            }, false)
            
            creation_date_string = datetime_string.split("T")[0]
            
            print_debug(
                "Task.deserialize_from_json()"
                + "\n\tdict = " + str(dict)
                + "\n\tdatetime_string = " + datetime_string
                + "\n\tcreation_date_string = " + creation_date_string
            )
    
    return is_parsing_completed
