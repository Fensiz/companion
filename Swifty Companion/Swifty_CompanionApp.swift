import SwiftUI

@main
struct Swifty_CompanionApp: App {
	@StateObject var viewModel: CompanionViewModel = CompanionViewModel()
	
    var body: some Scene {
		WindowGroup {
//			TestView()
			ContentView().environmentObject(viewModel)
        }
    }
}
