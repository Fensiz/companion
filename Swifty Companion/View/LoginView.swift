import SwiftUI
import Alamofire

struct LoginView: View {
	@EnvironmentObject var viewModel: CompanionViewModel
	@Binding var showSafari: Bool
	@State private var isLoading = false
	private let col: UIColor = #colorLiteral(red: 0.06363996118, green: 0.1928586066, blue: 0.3139088452, alpha: 1)
	
	var body: some View {
		GeometryReader { geometry in
			VStack() {
				VStack(alignment: .center) {
					Image("21logo")
						.resizable()
						.aspectRatio(1.0, contentMode: .fit)
						.frame(maxWidth: 300)
						.padding(20)
						.frame(alignment: .top)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.frame(height: geometry.size.height * 0.55)

				VStack(alignment: .center) {
					CompanionButton(action: buttonAction, label: "Enter")
				}
				.frame(height: geometry.size.height * 0.44)
			}
			.padding(.horizontal, 40)
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.foregroundColor(.black)
			.background(Image("back")
				.resizable()
				.aspectRatio(contentMode: .fill))
			.ignoresSafeArea()

		}
		.fullScreenCover(isPresented: $showSafari) {
			SFSafariViewWrapper(url: APIValues.requestCodeUrl)
		}
	}

//	let UID: String = "u-s4t2ud-730cb9baad70804f25a11099dc3fb0a94cfe2a80ebf43be52b8f2a0873b72838";
//	let secret: String = "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";
	
	func buttonAction() {
		showSafari.toggle()
	}
//
//	func buttonAction2() {
//		let code = "6d3cf935349b71d41a4722c68ee186f0b0fb4ab99e87ef003a5d2d9f2a153053"
//		let url = "https://api.intra.42.fr/oauth/token"
//		let param: Parameters = [
//			"client_id":"u-s4t2ud-730cb9baad70804f25a11099dc3fb0a94cfe2a80ebf43be52b8f2a0873b72838",
//			"client_secret":"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",
//			"grant_type":"authorization_code",
//			"redirect_uri":"bgreenblSwiftyCompanion://main",
//			"code":"\(code)"
//		]
//		let req = "https://api.intra.42.fr/oauth/token?client_id=u-s4t2ud-730cb9baad70804f25a11099dc3fb0a94cfe2a80ebf43be52b8f2a0873b72838&client_secret=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&grant_type=authorization_code&code=\(code)&redirect_uri=bgreenblSwiftyCompanion%3A%2F%2Fmain"
//		AF.request(url, method: .post, parameters: param).validate().response {
//			response in print(response)
//		}
//	}
	
	
}

