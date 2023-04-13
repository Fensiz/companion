import SwiftUI

struct MainView: View {
	@EnvironmentObject var viewModel: CompanionViewModel
	@State var users: [User]!
	@State var login: String = ""

	
    var body: some View {
		NavigationStack() {
			VStack {
				ZStack {
					Text("")
						.frame(height: 50)
						.frame(minWidth: 350)
						.background(RoundedRectangle(cornerRadius: 40)
							.fill(Color.white)
						)
						
					
					TextField(text: $login, label: { Text("login") })
						.font(.title)
						.foregroundColor(.black)
						.frame(height: 50)
						.padding(.horizontal)
						.overlay(
							RoundedRectangle(cornerRadius: 25)
								.stroke(.blue, lineWidth: 2)
						)
				}
				.padding(.top, 30)
				
				.compositingGroup()
				.shadow(radius: 10, x: 10, y: 10)
				Spacer(minLength: 20)
				if let users = viewModel.users {
					List {
						ForEach(users, id: \.self) { user in
							NavigationLink {
								UserView(user: user)
									.onAppear() {
										viewModel.fetchCompleteUserData(login: user.login!)
									}
							} label: {
								Text(user.login ?? "")
							}
						}
					}
				}
				Spacer(minLength: 20)
				CompanionButton(action: {
					viewModel.findUser(login: login)
				}, label: "Show")
				.font(.title)
				.shadow(radius: 10, x: 10, y: 10)

				.padding(.bottom, 10)
			}
			.frame(maxWidth: 330)
//			.navigationTitle("Navigation")
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
