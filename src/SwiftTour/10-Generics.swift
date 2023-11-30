// ========================================
// ジェネリクス
// ========================================

//不等号括弧（<>）内に関数名や型名を書いてジェネリクスを作成する。
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
	var result: [Item] = []
	for _ in 0..<numberOfTimes {
		result.append(item)
	}
	return result
}


//関数、メソッド、クラス、列挙型、構造体からジェネリクスを作成できる。
enum OptionalValue<Wrapped> { //Swift標準ライブラリの"OptionalValue"の置き換え
	case none
	case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


//"where"を書くとジェネリクス型の条件を定義できる。
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element { //"<T: Equatable>"は"... where T: Equatable"と同義
	for lhsItem in lhs {
		for rhsItem in rhs {
			if lhsItem == rhsItem {
				return true
			}
		}
	}
	return false
}
print(anyCommonElements([1, 2, 3], [3])) //"true"