//
//  TokenApi.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 24.03.2023.
//

import Foundation
import Alamofire

class TokenAPI {
	private(set) var token: Token!
	
	func fetch(usingCode: String) {
		let afUrl = APIValues.tokenUrl
		var param: Parameters = [:]
		param["grant_type"] 	= "authorization_code"
		param["client_id"] 		= APIValues.UID
		param["client_secret"] 	= APIValues.secret
		param["code"] 			= usingCode
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
}
