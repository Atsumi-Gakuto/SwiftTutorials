// ========================================
// Hello, world!
// ========================================

// Hello, world!

print("Hello, world!")



// ========================================
// 変数
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

print(widthLabel) //"The width is 94"


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
print(fruits) //"["strawberries", "grapes", "tangerines", "blueberries"]"

//空の配列・辞書を宣言
fruits = [] //配列
occupations = [:] //辞書

// ========================================
// 制御フロー
// ========================================

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
	if score > 50 {
		teamScore += 3
	}
	else {
		teamScore += 1
	}
}
print(teamScore) //"11"

//if文の条件式はBool型である必要がある。
//代入を示す"="の後にifやswitchを書くことも可能。
let scoreDecoration = if teamScore > 10 {
	" 🎉"
}
else {
	""
}
print("Score: " + String(teamScore) + scoreDecoration) //"Score: 11 🎉"


//変数型の直後に"?"をつけてnilの可能性があることを示す。
var optionalString: String? = "Hello"
print(optionalString == nil) //"false"

//if文でletを使用するとnilの可能性がある値を安全に扱える。
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
	greeting = "Hello, \(name)"
}
print(greeting)


//nilの可能性がある値には"??"でデフォルト値を指定できる。
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"
print(informalGreeting) //"Hi John Appleseed"

//nilの可能性がある値がnilのときは処理しないコードを書きたい場合は、同じ名前の変数をif文中でletすればよい。
if let nickname {
	print("Hey, \(nickname)") //nicknameはnilのため、このprint()は実行されない。
}


//switch文のcaseは様々な演算子を入れることが可能。
//breakは不要。
//defaultは必須。
let vegetable = "red pepper"
switch vegetable {
	case "celery":
		print("Add some raisins and make ants on a log.")
	case "cucumber", "watercress":
		print("That would make a good tea sandwich.")
	case let x where x.hasSuffix("pepper"):
		print("Is it a spicy \(x)?")
	default:
		print("Everything tastes good in soup.")
}
//"Is it a spicy red pepper?"


//for-inで辞書の各キーを反復処理する。
let interestingNumbers = [
	"Prime": [2, 3, 5, 7, 11, 13],
	"Fibonacci": [1, 1, 2, 3, 5, 8],
	"Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
	for number in numbers {
		if number > largest {
			largest = number
		}
	}
}
print(largest) //"25"


//while文とrepeat文
var n = 2
while n < 100 {
	n *= 2
}
print(n) //"128"

var m = 2
repeat {
	m *= 2
} while m < 100
print(m) //"128"


//..<を用いて指定した範囲のインデックス番号内でループする。
//"..<"で終了の値を含まない、"..."で終了の値を含む
var total = 0
for i in 0..4 { //C言語での`for(i = 0; i < 4; i++)`と同義
	total += i
}
print(total) //"6"