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