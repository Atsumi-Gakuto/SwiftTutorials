// ========================================
// プロトコルとエクステンション
// ========================================

//"protocol"でプロトコルを定義する。
//"mutating"と書かれたメソッドは継承先で変更する関数とマークされる。
protocol ExampleProtocol {
	var simpleDescription: String {
		get
	}
	mutating func adjust()
}

//クラス、列挙型、構造体全てにプロトコルを適用できる。
class SimpleClass: ExampleProtocol {
	var simpleDescription: String = "A very simple class."
	var anotherProperty: Int = 69105
	func adjust() {
		simpleDescription += " Now 100% adjusted."
	}
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print(aDescription) //"A very simple class. Now 100% adjusted."

struct SimpleStructures: ExampleProtocol {
	var simpleDescription: String = "A simple structure"
	mutating func adjust() {
		simpleDescription += " (adjusted)"
	}
}
var b = SimpleStructures()
b.adjust()
let bDescription = b.simpleDescription
print(bDescription) //"A simple structure (adjusted)"


//既存の型に新たな機能を追加する場合は"extension"を使用する。
//別のファイルやライブラリで宣言されている型についても適用が可能。
extension Int: ExampleProtocol {
	var simpleDescription: String {
		return "The number \(self)"
	}
	mutating func adjust() {
		self += 42
	}
}
print(7.simpleDescription) //"The number 7"


//プロトコルを単なえる名前付き型として使用できる。
//プロトコル外で定義したメソッドは使えない。
//こうすることで、元の変数の型が何であってもプロトコルとして扱われ、誤って元の変数型のプロパティ/メソッドにアクセスすることを防げる。
let protocolValue: any ExampleProtocol = a
print(protocolValue.simpleDescription) //"A very simple class. Now 100% adjusted."
//print(protocolValue.anotherProperty) //エラーになる。