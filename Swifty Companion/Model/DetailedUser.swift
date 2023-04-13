////
////  DetailUser.swift
////  Swifty Companion
////
////  Created by Симонов Иван Дмитриевич on 24.03.2023.
////
//
import Foundation
//struct DetailedUser: Codable {
//	var login: String
//	var image: Image42
//	var location: String?
//	var cursusUsers: [Cursus42]
//	var achievements: [Achievement42]
//	var projectsUsers: [Project42]
//}
//struct CampusUsers: Codable, Identifiable {
//	var id: Int
//	var login: String
//	var image: Image42
//}
//
//struct Image42: Codable {
//	var link: String?
//}
//
//
//struct Cursus42: Codable {
//	var grade: String?
//	var level: Double
//	var skills: [Skill42]
//}
//
//struct Skill42: Codable, Identifiable {
//	var id: Int
//	var name: String
//	var level: Double
//}
//
//struct Project42: Codable, Identifiable {
//	var id: Int
//	var finalMark: Int?
//	var status: String
//	var project: ProjectName
//	var cursusIds: [Int]
//	var markedAt: String?
//}
//
//struct ProjectName: Codable {
//	var name: String
//}
//
//struct Achievement42: Codable, Identifiable {
//	var id: Int
//	var name: String
//	var visible: Bool
//}




struct DetailedUser: Decodable {
	let id: Int
	let email: String?
	let login: String?
	let firstName: String?
	let lastName: String?
	let usualFullName: String?
	let usualFirstName: String?
	let url: String?
	let phone: String?
	let displayname: String?
	let kind: String
	let image: ImageCodable
	let staff: Bool?
	let correctionPoint: Int
	let poolMonth: String?
	let poolYear: String?
	let	location: String?
	let wallet: Int
	let anonymizeDate: Date? 	//"2025-10-24T00:00:00.000+02:00",
	let dataErasureDate: Date? 	//"2025-10-24T00:00:00.000+02:00",
	let alumni: Bool? 			//false,
	let active: Bool? 			//true
	let groups: [String] //заменить на [Groups]
	let cursusUsers: [CursusUsers]

//	  "groups": [],
//	  "cursus_users": [
//		{
//
//		}
//	  ],
//	  "projects_users": [],
//	  "languages_users": [
//		{
//		  "id": 2,
//		  "language_id": 3,
//		  "user_id": 2,
//		  "position": 1,
//		  "created_at": "2017-11-22T13:41:03.638Z"
//		}
//	  ],
//	  "achievements": [],
//	  "titles": [],
//	  "titles_users": [],
//	  "partnerships": [],
//	  "patroned": [
//		{
//		  "id": 4,
//		  "user_id": 2,
//		  "godfather_id": 15,
//		  "ongoing": true,
//		  "created_at": "2017-11-22T13:42:11.565Z",
//		  "updated_at": "2017-11-22T13:42:11.572Z"
//		}
//	  ],
//	  "patroning": [],
//	  "expertises_users": [
//		{
//		  "id": 2,
//		  "expertise_id": 3,
//		  "interested": false,
//		  "value": 2,
//		  "contact_me": false,
//		  "created_at": "2017-11-22T13:41:22.504Z",
//		  "user_id": 2
//		}
//	  ],
//	  "roles": [],
//	  "campus": [
//		{
//		  "id": 1,
//		  "name": "Cluj",
//		  "time_zone": "Europe/Bucharest",
//		  "language": {
//			"id": 3,
//			"name": "Romanian",
//			"identifier": "ro",
//			"created_at": "2017-11-22T13:40:59.468Z",
//			"updated_at": "2017-11-22T13:41:26.139Z"
//		  },
//		  "users_count": 28,
//		  "vogsphere_id": 1
//		}
//	  ],
//	  "campus_users": [
//		{
//		  "id": 2,
//		  "user_id": 2,
//		  "campus_id": 1,
//		  "is_primary": true
//		}
//	  ]
//


	let createdAt: Date? 		//"2018-07-17T08:57:33.128Z",
	let updatedAt: Date? 		//"2022-09-27T18:48:28.207Z",
	let alumnizedAt: Date? 		//null,


}

struct CursusUsers: Codable, Identifiable {
	static func == (lhs: CursusUsers, rhs: CursusUsers) -> Bool {
		lhs.id == rhs.id
	}
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}

	let id: Int 			//"id": 2,
	let beginAt: Date? 		//"begin_at": "2017-05-14T21:37:50.172Z",
	let endAt: Date? 		//"end_at": null,
	let grade: String? 		//"grade": null,
	let level: Double 		//"level": 0.0,
	let skills: [Skill] 	//	"skills": [],
	let cursusId: Int		//"cursus_id": 1,
	let hasCoalition: Bool	//"has_coalition": true,
	let user: UserSimple
	let cursus: Cursus
//	"user": {
//	  "id": 2,
//	  "login": "andre",
//	  "url": "https://api.intra.42.fr/v2/users/andre"
//	},
//	"cursus": {
//	  "id": 1,
//	  "created_at": "2017-11-22T13:41:00.750Z",
//	  "name": "Piscine C",
//	  "slug": "piscine-c"
//	}
}

struct Skill: Codable, Identifiable {
	var id: Int
	var name: String
	var level: Double
}

struct UserSimple: Codable, Identifiable {
	var id: Int
	var login: String
	var url: String
}
