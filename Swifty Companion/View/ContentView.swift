import SwiftUI

struct ContentView: View {
	@EnvironmentObject var viewModel: CompanionViewModel
	@State private var showSafari: Bool = false
	@State private var showLogin: Bool = true

    var body: some View {
		if viewModel.token == nil {
			LoginView(showSafari: $showSafari)
				.onOpenURL { url in
					if url.scheme == "bgreenblswiftycompanion" {
						if url.host == "main" {	
							if let code = url["code"] {
								viewModel.getToken(using: code)
								showSafari = false
							}
						} else {
							print("Answer: \(url)")
						}
					}
				}
				.alert("Secret expired", isPresented: $viewModel.showAlert) {
					Button("OK", role: .cancel, action: {})
						}
		} else {
			MainView()
		}
    }
	

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

