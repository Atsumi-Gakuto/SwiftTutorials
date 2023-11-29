// ========================================
// 関数とクロージャ
// ========================================

//関数定義
//"->"を使って関数の戻り型を定義する。
func greet(person: String, day: String) -> String {
	return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday")) //関数を呼び出す際の引数にはラベルが必要

//引数名の前に独自のラベルを定義可能。"_"にするとラベルを無効化できる。
func greet2(_ person: String, on day: String) -> String {
	return "Hello \(person), today is \(day)."
}
print(greet2("Bob", on: "Tuesday"))


//戻り値にタプルを指定することで複数の値を返すことができる。
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
	var min = scores[0]
	var max = scores[0]
	var sum = 0

	for score in scores {
		if score > max {
			max = score
		}
		else if score < min {
			min = score
		}
		sum += score
	}

	return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])

//タプルは名前でもインデックス番号でも参照可能
print(statistics.sum) //"120"
print(statistics.2) //"120"


//関数内関数
func returnFifteen() -> Int {
	var y = 10
	func add() {
		y += 5
	}
	add()
	return y
}
print(returnFifteen()) //"15"


//関数は別の関数を戻り値として返すことができる
func makeIncrementer() -> ((Int) -> Int) {
	func addOne(number: Int) -> Int {
		return 1 + number
	}
	return addOne
}
var increment = makeIncrementer()
print(increment(7)) //"8"


//関数の引数として別の関数を取ることも可能。
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
	for item in list {
		if condition(item) {
			return true
		}
	}
	return false
}
func lessThanTen(number: Int) -> Bool {
	return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen)) //"true"


//クロージャは中括弧（{}）で定義する。関数もクロージャの一種
//"in"を使って戻り値と中身を分ける。
numbers.map({ (number: Int) -> Int in
	let result = 3 * number
	return result
})


//クロージャを短く書くことができる。
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers) //"[60, 57, 21, 36]"


//クロージャのパラメータの代わりに数字でパラメータを参照することができる。特に短いクロージャで有効。
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers) //"[20, 19, 12, 7]"