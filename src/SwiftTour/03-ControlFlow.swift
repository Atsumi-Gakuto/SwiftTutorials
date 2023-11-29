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