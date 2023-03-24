import Foundation

struct User: Decodable, Hashable {
	static func == (lhs: User, rhs: User) -> Bool {
		lhs.id == rhs.id
	}
	func hash(into hasher: inout Hasher) {
		hasher.combine(id)
	}
	
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
	let createdAt: Date? 		//"2018-07-17T08:57:33.128Z",
	let updatedAt: Date? 		//"2022-09-27T18:48:28.207Z",
	let alumnizedAt: Date? 		//null,
	let alumni: Bool? 			//false,
	let active: Bool? 			//true
}

struct ImageCodable: Decodable {
	let link: String?
	let versions: Versions
}

struct Versions: Decodable {
	let large: String?
	let medium: String?
	let small: String?
	let micro: String?
}

//"id": 39962,
//	"email": "malallai@student.42.fr",
//	"login": "malallai",
//	"first_name": "Malo",
//	"last_name": "Allain",
//	"usual_full_name": "Malo Allain",
//	"usual_first_name": null,
//	"url": "https://api.intra.42.fr/v2/users/malallai",
//	"phone": "hidden",
//	"displayname": "Malo Allain",
//	"kind": "student",
//	"image": {
//	  "link": "https://cdn.intra.42.fr/users/39a641ed152b654cfbff5c5864eb05c1/malallai.jpg",
//	  "versions": {
//		"large": "https://cdn.intra.42.fr/users/a818d7a54298d333411557d0b55b61b3/large_malallai.jpg",
//		"medium": "https://cdn.intra.42.fr/users/53691acd1e0ea75b782ddbe121c17423/medium_malallai.jpg",
//		"small": "https://cdn.intra.42.fr/users/617de91b59fd7e59ecaf6470a4b37645/small_malallai.jpg",
//		"micro": "https://cdn.intra.42.fr/users/6f74b46e2016b0e6c41fa05b5952e17c/micro_malallai.jpg"
//	  }
//	},
//	"staff?": false,
//	"correction_point": 4,
//	"pool_month": "august",
//	"pool_year": "2018",
//	"location": null,
//	"wallet": 290,
//	"anonymize_date": "2025-10-24T00:00:00.000+02:00",
//	"data_erasure_date": "2025-10-24T00:00:00.000+02:00",
//	"created_at": "2018-07-17T08:57:33.128Z",
//	"updated_at": "2022-09-27T18:48:28.207Z",
//	"alumnized_at": null,
//	"alumni?": false,
//	"active?": true
