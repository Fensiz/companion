import UIKit

var greeting = "Hello, playground"

let UID: String = "u-s4t2ud-730cb9baad70804f25a11099dc3fb0a94cfe2a80ebf43be52b8f2a0873b72838"
let secret: String = "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"

let appUrl: URLComponents = {
	var components = URLComponents()
	components.scheme = "bgreenblSwiftyCompanion"
	components.host = "main"
	return components
}()

let intraUrl: URLComponents = {
	var components = URLComponents()
	components.scheme = "https"
	components.host = "api.intra.42.fr"
	components.path = "/oauth/authorize"

	let redirect = appUrl.string?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
	print(redirect)
	
	components.queryItems = [
		URLQueryItem(name: "client_id", value: UID),
		URLQueryItem(name: "redirect_uri", value: appUrl.string)
	]
	components.percentEncodedQuery = components.percentEncodedQuery?
		.replacingOccurrences(of: "/", with: "/".addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)
		.replacingOccurrences(of: ":", with: ":".addingPercentEncoding(withAllowedCharacters: .alphanumerics)!)
	return components
}()

print(intraUrl)

//let dateVar: Date = Date("2025-10-24T00:00:00.000+02:00")
//print(dateVar)
//let dateFormatter = DateFormatter()
//dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//let date = dateFormatter.date(from: "2025-10-24T00:00:00.000+02:00")
//print(date)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
dateFormatter.locale = Locale(identifier: "en_US_POSIX")
let date = dateFormatter.date(from: "2025-10-24T00:00:00.000+02:00")
print(date!)


struct SimpleOrder: Codable {
	var created: Date?
	var orderId: String?
	var price: String?
	private enum CodingKeys: String, CodingKey {
		case created = "time", orderId = "id", price
	}
	init(created: Date? = nil, orderId: String? = nil, price: String? = nil) {
		self.created = created
		self.orderId = orderId
		self.price = price
	}
}

extension SimpleOrder {
	var priceValue: Double? {
		guard let price = price else { return nil }
		return Double(price)
	}
}
extension Formatter {
	static let iso8601: DateFormatter = {
		let formatter = DateFormatter()
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
		return formatter
	}()
}

let jsonData = Data("""
{
	"time": "2025-10-24T00:00:00.000+02:00",
	"id": "0001",
	"price": "9.99"
}
""".utf8)
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .formatted(Formatter.iso8601)

do {
	let simpleOrder = try decoder.decode(SimpleOrder.self, from: jsonData)
	print(simpleOrder)
} catch {
	print(error)
}

class ClassOne {
	func printL() {
		print(123)
	}
}

class ClassTwo : ClassOne {
	override func printL() {
		print(456)
	}
	func printX() {
		super.printL()
	}
}

var q1: ClassTwo = ClassTwo()
q1.printL()
q1.printX()

//while let line = readLine() {
//   print(line)
//}
//[1,2,3].sample()
struct Token: Codable, CustomDebugStringConvertible {
	let accessToken: String
	let tokenType: String
	let expiresIn: Int
	let refreshToken: String
	let scope: String
	let createdAt: Int64
	var debugDescription: String {
		get {
			"""
				access_token: \(accessToken)
				token_type: \(tokenType)
				expires_in: \(expiresIn)
				refresh_token: \(refreshToken)
				scope: \(scope)
				createdAt: \(createdAt)
			"""
		}
	}
}

let token = Token(accessToken: "123", tokenType: "123", expiresIn: 1, refreshToken: "123", scope: "123", createdAt: 1)
print(token)

for _ in 1...64 {
	print(["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"].randomElement()!, terminator: "")
}



let s = String(format: "Level %2$.0f %1$.2f", 2.2, 20.0)

print(s)
