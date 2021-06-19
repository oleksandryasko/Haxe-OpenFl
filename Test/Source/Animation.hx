package;

import openfl.display.Sprite;
import haxe.Timer;
import figures.Figure;
import FiguresFactory;

class Animation {
	private var timer:Timer;

	public var interval = 5;
	public var step = 0.5;

	public function new() {}

	public function changeStepForFigures(figures:Array<Sprite>):Void {
		trace(figures.length);
		for (figure in figures) {
			figure.y += step;
		}
	}

	public function fallDown(figures:Array<Sprite>) {
		timer = new Timer(interval);
		timer.run = changeStepForFigures.bind(figures);
	}

	public function increaseSpeed() {
		step = step + 0.5;
	}

	public function reduceSpeed() {
		if (step == 0) {
			return;
		} else {
			step = step - 0.5;
		}
	}
}
