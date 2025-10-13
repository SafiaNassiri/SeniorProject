extends Node

var health: float = 100.0
var max_health: float = 100.0
var stamina: float = 100.0
var max_stamina: float = 100.0
var scrap: int = 0
var upgrades = {
	"speed": 0,
	"stamina": 0,
	"efficiency": 0
}

func use_stamina(amount: float):
	stamina = max(0, stamina - amount)

func recover_stamina(amount: float):
	stamina = min(max_stamina, stamina + amount)

func add_scrap(amount: int):
	scrap += amount

func apply_upgrade(upgrade_type: String, value: float):
	if upgrades.has(upgrade_type):
		upgrades[upgrade_type] += value
