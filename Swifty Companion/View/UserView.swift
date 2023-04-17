//
//  UserView.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 16.02.2023.
//

import SwiftUI

struct UserView: View {
	let user: User
	@EnvironmentObject var viewModel: CompanionViewModel
	@State var pickerState: Int = 0
//	@State var cursusUsers: [CursusUsers]


	var body: some View {
		ScrollView {
			
			GeometryReader { geo in
				VStack {
					Text(user.login ?? "")
						.font(.title)
				
					HStack {
						VStack {
							HStack {
								Text("Wallet")
								Spacer()
								Text(String(user.wallet))
									.frame(minWidth: 100)
									.frame(alignment: .center)
							}
							.padding(.vertical, 5)
							HStack {
								Text("Eval points")
								Spacer()
								Text("10000")
									.frame(minWidth: 100)
									.frame(alignment: .center)
							}
							.padding(.vertical, 5)
							HStack {
								Text("Cursus")
								Spacer()
								if viewModel.detailedUser == nil {
									Text("loading")
										.frame(minWidth: 100)
										.frame(alignment: .center)
								} else {
									//								cursusUsers = viewModel.detailedUser.cursusUsers
									Picker("Cursus", selection: $pickerState) {
										ForEach (0..<viewModel.detailedUser.cursusUsers.count, id: \.self) { id in
											//										HStack {
											Text("\(viewModel.detailedUser.cursusUsers[id].cursus.name)")
											//											Text("\(pickerState)")
											//										}
										}
										
										
										
									}
									.border(.red)
								}
							}
							.padding(.vertical, 5)
							HStack {
								Text("Grade")
								Spacer()
								Text("Member")
									.frame(minWidth: 100)
									.frame(alignment: .center)
							}
							.padding(.vertical, 5)
						}
						.frame(minWidth: 220)
						.frame(width: geo.size.width * 0.6)
						.border(.green)
						AsyncImage(url: URL(string:
												//viewModel.users?.first?.image.link ??
											user.image.link ??
											"https://cdn.leroymerlin.ru/lmru/image/upload/v1645093827/b_white,c_pad,d_photoiscoming.png,f_auto,h_2000,q_auto,w_2000/lmcode/PJ5BdHecy0Szb9mbEqdxrA/83609854.png"
										   )) { image in
							image
								.resizable()
								.scaledToFit()
								.clipShape(RoundedRectangle(cornerRadius: 40))
						} placeholder: {
							ProgressView()
						}
						.background(RoundedRectangle(cornerRadius: 40)
							.fill(Color.white)
						)
						.overlay(
							RoundedRectangle(cornerRadius: 40)
								.stroke(.green, lineWidth: 1)
						)
						.compositingGroup()
						//					.clipShape(Circle())
						.shadow(color: Color.black.opacity(0.5), radius: 5, x: 10, y: 10)
						.aspectRatio(1.0, contentMode: .fit)
//						.frame(minHeight: 50)
						.layoutPriority(1)
						.frame(maxWidth: geo.size.width * 0.35, maxHeight: geo.size.width * 0.35)
						.frame(width: geo.size.width * 0.35, height: geo.size.width * 0.35)
						.border(.green)
						
					}
					.border(.red)
//					.padding(geo.size.width * 0.05)
					LevelBar(value: getProgressValue())
						.border(.red)
//					Text("\(UIScreen.main.bounds.width)")
//					Text("Hello, World!")
//						.frame(minWidth: 300, minHeight: 80)
//						.font(.title)
//						.foregroundColor(Color.black)
//					//				.padding()
//
//					//			.border(.black, width: 2)
//						.background(RoundedRectangle(cornerRadius: 40)
//							.fill(Color.white)
//						)
//						.overlay(
//							RoundedRectangle(cornerRadius: 40)
//								.stroke(.green, lineWidth: 1)
//
//						)
//						.compositingGroup()  // для того чтобы тень не применялась к самому тексту
//					//			.compositingGroup()
//						.shadow(color: Color.black.opacity(0.5), radius: 5, x: 10, y: 10)
//					Text("Hello, world!")
//						.font(.title)
//						.foregroundColor(Color.black)
//						.padding()
//						.background(RoundedRectangle(cornerRadius: 10)
//							.fill(Color.white)
//						)
//						.compositingGroup()     // << here !!
//						.shadow(color: Color.black.opacity(1), radius: 5, x: 10, y: 10) // << shadow to all composition
//				Text()
				}
			}
		}
		
	}
	private func getProgressValue() -> Double {
		if viewModel.detailedUser == nil ||
			viewModel.detailedUser.cursusUsers.count <= pickerState {
			return 0
		}
		return viewModel.detailedUser.cursusUsers[pickerState].level
	}
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
