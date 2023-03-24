//
//  TestView.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 18.02.2023.
//

import SwiftUI

struct TestView: View {
	var body: some View {
		ScrollView {
			VStack {
				HStack {
					VStack {
						HStack {
							Text("Wallet")
							Spacer()
							Text("10000")
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
							
							Text("42 cursus")
								.frame(minWidth: 100)
								.frame(alignment: .center)
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
					.border(.green)
					AsyncImage(url: URL(string: "https://cdn.leroymerlin.ru/lmru/image/upload/v1645093827/b_white,c_pad,d_photoiscoming.png,f_auto,h_2000,q_auto,w_2000/lmcode/PJ5BdHecy0Szb9mbEqdxrA/83609854.png")) { image in
						image
							.resizable()
							.scaledToFill()
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
					.shadow(color: Color.black.opacity(0.5), radius: 5, x: 10, y: 10)
					.aspectRatio(contentMode: .fit)
					.frame(minHeight: 50)
					.layoutPriority(1)
					
				}
				.padding(10)
				
				ProgressView(value: 0.4)
					.padding(10)
					.accentColor(Color.green)
					.scaleEffect(x: 1, y: 4, anchor: .center)
//					.compositingGroup()
					.shadow(color: Color.black.opacity(0.5), radius: 5, x: 10, y: 10)
				Text("\(UIScreen.main.bounds.width)")
				Text("Hello, World!")
					.frame(minWidth: 300, minHeight: 80)
					.font(.title)
					.foregroundColor(Color.black)
				//				.padding()
				
				//			.border(.black, width: 2)
					.background(RoundedRectangle(cornerRadius: 40)
						.fill(Color.white)
					)
					.overlay(
						RoundedRectangle(cornerRadius: 40)
							.stroke(.green, lineWidth: 1)
						
					)
					.compositingGroup()  // для того чтобы тень не применялась к самому тексту
				//			.compositingGroup()
					.shadow(color: Color.black.opacity(0.5), radius: 5, x: 10, y: 10)
				
				
				Text("Hello, world!")
					.font(.title)
					.foregroundColor(Color.black)
					.padding()
					.background(RoundedRectangle(cornerRadius: 10)
						.fill(Color.white)
					)
					.compositingGroup()     // << here !!
					.shadow(color: Color.black.opacity(1), radius: 5, x: 10, y: 10) // << shadow to all composition
//				Text()
			}
		}
		
	}
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
