extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

onready var HeartUIFull = $HeartUIFull
onready var HeartUIEmpty = $HeartUIEmpty

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if HeartUIFull != null:
		HeartUIFull.rect_size.x = hearts * 15
		
func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if HeartUIEmpty != null:
		HeartUIEmpty.rect_size.x = max_hearts * 15
	
func _ready():
	self.max_hearts = PlayerStat.max_health
	self.hearts = PlayerStat.health
	PlayerStat.connect("health_Change", self, "set_hearts")
	PlayerStat.connect("max_health_changed", self, "set_max_hearts")
	
	
