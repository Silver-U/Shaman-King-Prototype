extends Label

@export var limboHsm : LimboHSM :
	set(value):
		if limboHsm != null:
			limboHsm.active_state_changed.disconnect(_on_active_state_changed)
			
		limboHsm = value
		
		if limboHsm != null:
			var currentState = limboHsm.get_active_state()
			print("tramn")
			print(currentState)
			
			if currentState != null:
				print("moommo")
				print(currentState)
				text = currentState.name
				print("damn")
				print(text)
			limboHsm.active_state_changed.connect(_on_active_state_changed)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	limboHsm = $"../LimboHSM"
	print(limboHsm)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_active_state_changed(current: LimboState, _previous: LimboState) -> void:
	text = current.name
	print(text)
