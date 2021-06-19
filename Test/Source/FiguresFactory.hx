package;

import figures.Figure;
import figures.Rectangle;
import figures.Circle;
import figures.Triangle;
import figures.Ellipse;
import figures.Polygon;

class FiguresFactory {
	public function new() {}

	public function getRandomFigure():Figure {
		return getFigure(Math.floor(Math.random() * 5));
	}

	private function getFigure(num:Int):Figure {
		switch (num) {
			case 0:
				return new Rectangle();
			case 1:
				return new Circle();
			case 2:
				return new Triangle();
			case 3:
				return new Ellipse();
			case 4:
				return new Polygon();
			default:
				throw 'exception';
		}
	}
}
