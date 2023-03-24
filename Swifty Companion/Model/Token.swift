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
			\n	access_token: \(accessToken)
				token_type: \(tokenType)
				expires_in: \(expiresIn)
				refresh_token: \(refreshToken)
				scope: \(scope)
				createdAt: \(createdAt)
			"""
		}
	}
}
