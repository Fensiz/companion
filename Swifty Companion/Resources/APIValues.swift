import Foundation

struct APIValues {
	static let UID: String = "u-s4t2ud-730cb9baad70804f25a11099dc3fb0a94cfe2a80ebf43be52b8f2a0873b72838"
	static let secret: String = "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"
	static let address: String = "https://api.intra.42.fr"
	static let url: URLComponents = {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "api.intra.42.fr"
		components.path = "/oauth/authorize"
		
		components.queryItems = [
			URLQueryItem(name: "client_id", value: UID),
			URLQueryItem(name: "redirect_uri", value: "")
		]
		return components
	}()
	static let appUrl: URLComponents = {
		var components = URLComponents()
		components.scheme = "bgreenblSwiftyCompanion"
		components.host = "main"
		return components
	}()
	
	static let callbackUrl: String = "bgreenblSwiftyCompanion://main"//.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
	static let tokenUrl: String = "https://api.intra.42.fr/oauth/token"
	static let authorizeUrl: String = "https://api.intra.42.fr/oauth/authorize"
	static let requestCodeUrl: URL = URL(string: "https://api.intra.42.fr/oauth/authorize?client_id=\(UID)&redirect_uri=bgreenblSwiftyCompanion%3A%2F%2Fmain&response_type=code")!
}
