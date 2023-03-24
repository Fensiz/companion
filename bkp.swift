////
////  LoginView.swift
////  Swifty Companion
////
////  Created by Симонов Иван Дмитриевич on 23.01.2023.
////
//
//import SwiftUI
//
//struct LoginView: View {
//	@State var login: String = ""
//	@State var password: String = ""
//	@State private var isLoading = false
//	private let col: UIColor = #colorLiteral(red: 0.06363996118, green: 0.1928586066, blue: 0.3139088452, alpha: 1)
//	
//	var body: some View {
//		
//		GeometryReader { geometry in
//			VStack() {
//				VStack(alignment: .center) {
//					Image("21logo")
//					
//						.resizable()
//						.aspectRatio(1.0, contentMode: .fit)
//					
//						.frame(maxWidth: 300)
//					//					.alignmentGuide(.top, computeValue: { d in d[.top]})
//					
//					//				.frame(maxWidth: min(UIScreen.main.bounds.width, UIScreen.main.bounds.height))
//						.padding(20)
//						.frame(alignment: .top)
//				}
//				.frame(maxWidth: .infinity, maxHeight: .infinity)
//				.frame(height: geometry.size.height * 0.55)
//				
//				VStack(alignment: .center) {
//					
//					//				Spacer(minLength: 1)
//					TextField("Enter login", text: $login)
//						.frame(height: 50)
//						.frame(maxWidth: 300)
//						.padding(.horizontal)
//					//				.overlay(RoundedRectangle(cornerRadius: 25)
//					//					.stroke(Color.gray)
//					//					)
//					
//						.background(Color.white)
//						.cornerRadius(25)
//					
//					SecureField("Enter password", text: $password)
//						.frame(height: 50)
//						.frame(maxWidth: 300)
//						.padding(.horizontal)
//						.background(Color.white)
//						.cornerRadius(25)
//					//				.overlay(RoundedRectangle(cornerRadius: 25)
//					//
//					////					.stroke(Color.gray)
//					//
//					////					.shadow(color: .purple, radius: 3)
//					//				)
//					//			Spacer(minLength: 10)
//					Button("Enter", action: {})
//						.frame(height: 50)
//						.frame(maxWidth: 300)
//						.padding(.horizontal)
//						.foregroundColor(.white)
//						.background(
//							LinearGradient(
//								colors: [.init(uiColor: #colorLiteral(red: 0, green: 0.9581305385, blue: 0.6586436629, alpha: 1)), .init(uiColor: #colorLiteral(red: 0, green: 0.5795812011, blue: 1, alpha: 1))],
//								startPoint: .topLeading,
//								endPoint: .bottomTrailing
//							)
//						)
//						.cornerRadius(25)
//					
//					
//					//			Text("Swift by Sundell")
//					//				.font(.title)
//					//				.padding(35)
//					//				.background(
//					//					LinearGradient(
//					//						colors: [.orange, .red],
//					//						startPoint: .topLeading,
//					//						endPoint: .bottomTrailing
//					//					)
//					//				)
//					//				.overlay(alignment: .topTrailing) {
//					//					Image(systemName: "star")
//					//						.padding([.top, .trailing], 5)
//					//			}
//					//			.overlay {
//					//				if isLoading {
//					//					ZStack {
//					//						Color(white: 0, opacity: 0.75)
//					//						ProgressView().tint(.white)
//					//					}
//					//				}
//					//			}
//					//						.foregroundColor(.white)
//					//						.cornerRadius(20)
//					//
//					
//					
//					
//				}
//				.frame(height: geometry.size.height * 0.45)
//				
//				
//			}
////			.frame(height: 500)
//			.padding(.horizontal, 40)
//			.frame(maxWidth: .infinity, maxHeight: .infinity)
//			.foregroundColor(.black)
//			.background(Color.init(uiColor: col))
//			
//		}
//
////		.frame(maxWidth: .infinity, maxHeight: .infinity)
//	}
//		
//}
//
//struct LoginView_Previews: PreviewProvider {
//	static var previews: some View {
//		LoginView()
//	}
//}
