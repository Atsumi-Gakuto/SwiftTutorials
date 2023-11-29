// ========================================
// オブジェクトとクラス
// ========================================

//クラスの定義
class Shape {
	var numberOfSides = 0
	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
}

//クラスのインスタンス化
var shape = Shape() //"new"はいらない
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription) //"A shape with 7 sides."


//初期化子（イニシャライザ・コンストラクタ）付きクラス
class NamedShape {
	var numberOfSides: Int = 0
	var name: String

	init(name: String) { //初期化子
		self.name = name
	}

	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
}


//クラスの継承とオーバーライド
class Square: NamedShape {
	var sideLength: Double

	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name) //スーパークラスの初期化子
		numberOfSides = 4
	}

	func area() -> Double {
		return sideLength * sideLength
	}

	override func simpleDescription() -> String { //スーパークラスの関数をオーバーライド
		return "A square with sides of length \(sideLength)."
	}
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
print(test.simpleDescription()) //"A square with sides of length 5.2."l


//クラスのプロパティはゲッター/セッターを持つことができる
class EquilateralTriangle: NamedShape {
	var sideLength: Double = 0.0

	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 3
	}

	var perimeter: Double {
		get {
			return 3.0 * sideLength
		}
		set {
			sideLength = newValue / 3.0
		}
	}

	override func simpleDescription() -> String {
		return "An equilateral triangle with sides of length \(sideLength)."
	}
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter) //"9.3"
triangle.perimeter = 9.9
print(triangle.sideLength) //"3.3000000000000003"


//"willSet"/"didSet"をプロパティに設定すると、そのプロパティが変更される直前/直後に処理を実行できる。
class TriangleAndSquare {
	var triangle: EquilateralTriangle {
		willSet {
			square.sideLength = newValue.sideLength //"newValue"に新しい値が入る。"didSet"の場合は"oldValue"に古い値が入る。
		}
	}
	var square: Square {
		willSet {
			triangle.sideLength = newValue.sideLength
		}
	}
	init(size: Double, name: String) {
		square = Square(sideLength: size, name: name)
		triangle = EquilateralTriangle(sideLength: size, name: name)
	}
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength) //"10.0"
print(triangleAndSquare.triangle.sideLength) //"10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength) //"50.0"


//nilの可能性がある値がnilだった場合、その後に続く式の評価は無視され、式全体はnilになる。
//そうでない場合、nilの可能性がある値はアンラップされる。
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength