// ========================================
// 列挙型と構造体
// ========================================

//列挙型の宣言
//関数を含めることも可能
//デフォルトでは0から順にインデックスが割り振られるが、明示的に開始番号を指定することも可能。
enum Rank: Int {
	case ace = 1
	case two, three, four, five, six, seven, eight, nine, ten
	case jack, queen, king

	func simpleDescription() -> String {
		switch self {
			case .ace:
				return "ace"
			case .jack:
				return "jack"
			case .queen:
				return "queen"
			case .king:
				return "king"
			default:
				return String(self.rawValue)
		}
	}
}
let ace = Rank.ace
print(ace) //"ace"
let aceRawValue = ace.rawValue
print(aceRawValue) //"1"


//"init?(rawValue:)"で特定のインデックス番号を持つ列挙要素でインスタンス化ができる。
if let convertedRank = Rank(rawValue: 3) {
	let threeDescription = convertedRank.simpleDescription()
	print(threeDescription) //"3"
}


//列挙名で参照することも可能。
enum Suit {
	case spades, hearts, diamonds, clubs

	func simpleDescription() -> String {
		switch self {
			case .spades:
				return "spades"
			case .hearts:
				return "hearts"
			case .diamonds:
				return "diamonds"
			case .clubs:
				return "clubs"
		}
	}
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(heartsDescription) //"hearts"


//列挙子にもプロパティを持つことができ、インスタンス化された時に代入する。
enum ServerResponse {
	case result(String, String)
	case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
	case let .result(sunrise, sunset):
		print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
	case let .failure(message):
		print("Failure... \(message)")
}
//"Sunrise is at 6:00 am and sunset is at 8:09 pm."


//構造体の宣言
//構造体は常にコピーを返すが、クラスは参照渡しをする。
struct Card {
	var rank: Rank
	var suit: Suit
	func simpleDescription() -> String {
		return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
	}
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription) //"The 3 of spades"