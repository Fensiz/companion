import Foundation
import Alamofire

class CompanionViewModel: ObservableObject {
	@Published private(set) var users: [User]!
	@Published private(set) var token: Token!
	@Published private(set) var detailedUser: DetailedUser!
	let url = "https://api.intra.42.fr/v2/users"
	let decoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		let formatter = DateFormatter()
		formatter.calendar = Calendar(identifier: .iso8601)
		formatter.locale = Locale(identifier: "en_US_POSIX")
		formatter.timeZone = TimeZone(secondsFromGMT: 0)
		formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
		decoder.dateDecodingStrategy = .formatted(formatter)
		return decoder
	}()
	
	func loginButtonAction() {
		
	}
	
	func testButtonAction() {
		
	}
	
	func storeToken() {
		do {
			// Create JSON Encoder
			let encoder = JSONEncoder()

			// Encode token
			let data = try encoder.encode(token)
			
			UserDefaults.standard.set(data, forKey: "note")
		} catch {
			print("Unable to Encode Note (\(error))")
		}
	}
	
	func getToken(using: String) {
		let afUrl = APIValues.tokenUrl
		var param: Parameters = [:]
		param["grant_type"] 	= "authorization_code"
		param["client_id"] 		= APIValues.UID
		param["client_secret"] 	= APIValues.secret
		param["code"] 			= using
		param["redirect_uri"] 	= APIValues.callbackUrl
		print("--------")
		print(afUrl)
		print(param)
		print("--------")
		let decoder: JSONDecoder = {
			let decoder = JSONDecoder()
			decoder.keyDecodingStrategy = .convertFromSnakeCase
			return decoder
		}()
		AF.request(afUrl, method: .post, parameters: param)
			.validate().responseDecodable(of: Token.self, decoder: decoder) { response in
//				print(response.request)
				switch response.result {
				case .success(let token):
					self.token = token
					print("success: \(token)")
				case .failure(let error):
					print("error: \(error)")
				}
		}
	}
	func getCursus() {
		let afUrl = "https://api.intra.42.fr/v2/cursus"
		let decoder: JSONDecoder = {
			let decoder = JSONDecoder()
			decoder.keyDecodingStrategy = .convertFromSnakeCase
			let formatter = DateFormatter()
			formatter.calendar = Calendar(identifier: .iso8601)
			formatter.locale = Locale(identifier: "en_US_POSIX")
			formatter.timeZone = TimeZone(secondsFromGMT: 0)
			formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
			decoder.dateDecodingStrategy = .formatted(formatter)
			return decoder
		}()
		let headers: HTTPHeaders = [
			"Authorization":"\(token?.tokenType ?? "") \(token?.accessToken ?? "")"
		]
		AF.request(afUrl)
	}
	func fetchCompleteUserData(login: String) {
		let url = "https://api.intra.42.fr/v2/users/\(login)"
		let headers: HTTPHeaders = [
			"Authorization":"\(token?.tokenType ?? "") \(token?.accessToken ?? "")"
		]
		AF.request(url, headers: headers)
			.validate()
			.responseDecodable(of: DetailedUser.self, decoder: decoder) { response in
				switch response.result {
				case .success(let user):
					self.detailedUser = user
					print("success: \(String(describing: self.detailedUser))")
					break
				case .failure(let error):
					print("error: \(error)")
				}
			}
	}
	
	func findUser(login: String) {

		let headers: HTTPHeaders = [
			"Authorization":"\(token?.tokenType ?? "") \(token?.accessToken ?? "")"
		]
		let param: Parameters = [
//		  "filter[login]":"\(login.lowercased())",
		  "range[login]":"\(login.lowercased()),\(login.lowercased())z"
		]
		if login.count > 2 {
			AF.request(url, parameters: param, headers: headers)
				.validate()
//				.responseString(completionHandler: { response in
//					print(response)
//				})
				.responseDecodable(of: [User].self, decoder: decoder) { response in
//					print(response)
					switch response.result {
					case .success(let users):
						self.users = users
						print("success: \(self.users.first?.login ?? "")")
						print("users count: \(users.count)")
						break
					case .failure(let error):
						print("error: \(error)")
				}
			}
		}
	}
}
