// Hello, world!

print("Hello, world!")

// ========================================

//変数宣言
var myVariable = 42 //変数宣言
print("myVariable = \(myVariable)")

myVariable = 50 //変数は後で内容を変更可
print("myVariable = \(myVariable)")


let myConstant = 42 //定数宣言
print("myConstant = \(myConstant)")

//myConstant = 50 //定数の内容は変更不可。エラーになる。


//Swiftは代入されたデータから変数の型推論をする。明示的に型を定義することもできる。
let implicitInteger = 70 //Int型と推論
let implicitDouble = 70.0 //Double型と推論
let explicitDouble: Double = 70 //明示的にDouble型と定義


//型は暗黙的に変換されないため、明示的な型変換が必要。
let label = "The width is " //String型
let width = 94 //Int型

//let widthLabel = label + width //暗黙的にInt型からString型へ変換されない。エラーになる。
let widthLabel = label + String(width) //Int型からString型への明示的な型変換を行う。

print(widthLabel)


//複数行にわたる文字列は二重引用符（"）3つで囲む。
let apples = 1
let oranges = 3
let quotation = """
	Even though there's whitespace to the left,
	the actual lines aren't indented.
		Except for this line.
	Double quotes (") can appear without being escaped.

	I still have \(apples + oranges) pieces of fruit.
	"""


//大括弧（[]）で配列や辞書を作成。インデックスやキーを用いて要素を参照。
var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"

var occupations = [
	"Malcolm": "Captain",
	"Kaylee": "Mechanic", //カンマ終わりは許される。
]
occupations["Jayne"] = "Public Relations"


//要素を追加すると配列のスペースが自動的に確保される。
fruits.append("blueberries")
print(fruits)

//空の配列・辞書を宣言
fruits = [] //配列
occupations = [:] //辞書