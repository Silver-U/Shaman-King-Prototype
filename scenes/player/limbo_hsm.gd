extends LimboHSM

@export var player: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize(player)
	set_active(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_active_state_changed(current: LimboState, previous: LimboState) -> void:
	pass # Replace with function body.
