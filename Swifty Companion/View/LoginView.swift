import SwiftUI
import Alamofire

struct LoginView: View {
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
					CompanionButton(action: { showSafari.toggle() }, label: "Enter")
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
}

