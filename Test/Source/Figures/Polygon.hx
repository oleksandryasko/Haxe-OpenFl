package figures;

import openfl.display.Sprite;

class Polygon extends Figure {
	private var a = 94.05;
	private var sides = 5;

	public function new() {
		var radius = randomRadius(20, 80);
		var center = (radius / 2);
		var angle = 270 * Math.PI / 180;
		super();

		this.sprite.graphics.moveTo(0, 0);
		for (i in 0...5) {
			var x = (center + radius * Math.cos(i * 2 * Math.PI / sides + angle));
			var y = (center + radius * Math.sin(i * 2 * Math.PI / sides + angle));
			if (i == 0)
				this.sprite.graphics.moveTo(x, y);
			else
				this.sprite.graphics.lineTo(x, y);
		}
	}

	public function calcArea() {
		var angle = Math.floor(270 * Math.PI / 180);
		return Math.floor((sides * Math.pow(a, 2)) / 4 * (Math.tan(angle / sides)));
	}

	private function randomRadius(min, max) {
		var rand = min + Math.random() * (max + 1 - min);
		return Math.floor(rand);
	}
}
