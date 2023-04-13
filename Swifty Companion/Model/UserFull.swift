//
//  UserFull.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 24.03.2023.
//

import Foundation

class UserFull: ObservableObject {
	init(user: User) {
		self.user = user
	}
	let user: User
//	let coalition: Coalition
	@Published var cursus: Cursus!
}

struct Coalition: Codable {
	
}

