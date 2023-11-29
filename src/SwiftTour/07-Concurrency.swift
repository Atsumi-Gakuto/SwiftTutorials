// ========================================
// 非同期処理
// ========================================

//関数に"async"で非同期処理とマークする。
func fetchUserID(from server: String) async -> Int {
	if server == "primary" {
		return 97
	}
	return 501
}


//非同期関数を呼ぶには直前に"await"を書く。
func fetchUsername(from server: String) async -> String {
	let userID = await fetchUserID(from: server)
	if userID == 501 {
		return "John Appleseed"
	}
	return "Guest"
}


//"async let"を使用して非同期関数を呼ぶと、後で複数の非同期関数と一緒に非同期処理を実行できる。
func connectUser(to server: String) async {
	async let userID = fetchUserID(from: server)
	async let username = fetchUsername(from: server)
	let greeting = await "Hello \(username), user ID \(userID)"
	print(greeting)
}


//"Task"内に非同期処理を書くと、その処理の完了を待たず次の処理を実行することが可能。
Task {
	await connectUser(to: "primary") //"Hello Guest, user ID 97"
}


//タスクグループを使うと非同期処理をまとめることが可能。
let userIDs = await withTaskGroup(of: Int.self) { group in
	for server in ["primary", "secondary", "development"] {
		group.addTask {
			return await fetchUserID(from: server)
		}
	}

	var results: [Int] = []
	for await result in group {
		results.append(result)
	}
	return results
}


//アクターはクラスと似ているが、アクターは異なる非同期関数が同じアクターのインスタンスと安全にやりとりできることを保証する。
//つまり、セマフォ機能を持つ。
actor ServerConnection {
	var server: String = "primary"
	private var activeUsers: [Int] = []
	func connect() async -> Int {
		let userID = await fetchUserID(from: server)
		// ... communicate with server ...
		activeUsers.append(userID)
		return userID
	}
}
let server = ServerConnection()
let userID = await server.connect()