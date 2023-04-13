//
//  UserAPI.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 24.03.2023.
//

import Foundation

class UserAPI: ObservableObject {
	let user: User
//	@Published var cursus
	
	init(user: User) {
		self.user = user
	}
}
