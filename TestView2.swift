//
//  TestView2.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 23.03.2023.
//

import SwiftUI

//struct TestView2: View {
//	private var bgColors: [Color] = [ .indigo, .yellow, .green, .orange, .brown ]
//    var body: some View {
//		NavigationStack {
////			NavigationLink {
////				Text("Destination")
////			} label: {
////				Text("Tap me")
////			}
//			List(bgColors, id: \.self) { bgColor in
//				NavigationLink {
//					bgColor
//						.frame(maxWidth: .infinity, maxHeight: .infinity)
//				} label: {
//					Text(bgColor.description)
//				}
//
//			}
//			.listStyle(.plain)
//
//			.navigationTitle("Color")
//		}
//    }
//}


struct TestView2: View {
	private var bgColors: [Color] = [ .indigo, .yellow, .green, .orange, .brown ]
 
	@State private var path: [Color] = []
 
	var body: some View {
		VStack {
			NavigationStack(path: $path) {
				List(bgColors, id: \.self) { bgColor in
					
					NavigationLink(value: bgColor) {
						Text(bgColor.description)
					}
					
				}
				.listStyle(.plain)
				
				.navigationDestination(for: Color.self) { color in
					VStack {
						Text("\(path.count), \(path.description)")
							.font(.headline)
						
						HStack {
							ForEach(path, id: \.self) { color in
								color
									.frame(maxWidth: .infinity, maxHeight: .infinity)
							}
							
						}
						
						List(bgColors, id: \.self) { bgColor in
							
							NavigationLink(value: bgColor) {
								Text(bgColor.description)
							}
							
						}
						.listStyle(.plain)
						
					}
				}
				
				.navigationTitle("Color")
				
			}
			Text("Test")
				.font(.largeTitle)
				.padding()
				.background(
					RoundedRectangle(cornerRadius: 10)
						.foregroundColor(.blue)
						.shadow(color: Color.black.opacity(1.0), radius: 10, x: 10, y: 10)
						.overlay(
							RoundedRectangle(cornerRadius: 10)
								.stroke()
								.foregroundColor(.red)
								
						)
				)
								Text("Hello, world!")
									.font(.title)
									.foregroundColor(Color.black)
									.padding()
									.background(RoundedRectangle(cornerRadius: 10)
										.fill(Color.white)
									)
									.compositingGroup()     // << here !!
									.shadow(color: Color.black.opacity(1), radius: 5, x: 10, y: 10) // << shadow to all composition
			
		}

		
	}
}

struct TestView2_Previews: PreviewProvider {
    static var previews: some View {
        TestView2()
    }
}
