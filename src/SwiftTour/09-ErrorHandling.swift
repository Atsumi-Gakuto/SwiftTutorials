// ========================================
// エラーハンドリング
// ========================================

//"Error"プロトコルに準拠するとエラーを表現できる。
enum PrinterError: Error {
	case outOfPaper
	case noToner
	case onFire
}


//"throw"でエラーを投げる。関数に"throws"と書くと、エラーを投げる可能性がある関数としてマークできる。
func send(job: Int, toPrinter printerName: String) throws -> String {
	if printerName == "Never Has Toner" {
		throw PrinterError.noToner
	}
	return "Job sent"
}


//do-catchでエラーハンドリング
//エラーが起こりうるメソッドに対してtryを使用する。
do {
	let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
	print(printerResponse) //"Job sent"
}
catch {
	print(error) //明示的に名前を指定しない限り、"error"にエラー内容が代入される。
}


//"catch"は複数書くことも可能であり、switch文の"case:"のように動作する。
do {
	let printerResponse = try send(job: 1040, toPrinter: "Gutenberg")
	print(printerResponse) //"Job sent"
}
catch PrinterError.onFire {
	print("I'll just put this over here, with the rest of the fire.")
}
catch let printerError as PrinterError { //エラー変数名を指定
	print("Printer error: \(printerError)")
}
catch {
	print(error)
}


//"try?"でエラーハンドリングを行い、エラーが発生した場合、結果がnilになる。
//エラーが発生しない場合、戻り値が含まれたオプショナル値が帰ってくる。
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


//"defer"ブロックに書いたコードは関数内でエラーが発生したかどうか関係なく、関数の最後に実行される（"finally"みたいなものだが、try-catch外でも使える）。
//クリーンアップコードが書ける。
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
	fridgeIsOpen = true
	defer {
		fridgeIsOpen = false
	}

	let result = fridgeContent.contains(food)
	return result
}

if fridgeContains("banana") {
	print("Found a banana")
}
print(fridgeIsOpen) //"false"