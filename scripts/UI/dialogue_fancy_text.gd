extends RichTextLabel

const textSpeed: float = 1.5
var tween: Tween
func _ready() -> void:
	visible_ratio = 0.0
	tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(
		self,
		"visible_ratio",
		1.0,
		textSpeed
	)
