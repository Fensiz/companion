//
//  File2.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 08.03.2023.
//

import SwiftUI
struct Test2View: View {
	var colors = ["Red", "Green", "Blue", "Tartan"]
	@State private var selectedColor = "Red"

	var body: some View {
		VStack {
			Picker("Please choose a color", selection: $selectedColor) {
				ForEach(colors, id: \.self) {
					Text($0)
				}
			}
			Text("You selected: \(selectedColor)")
		}
	}
}
struct Test2View_Previews: PreviewProvider {
	static var previews: some View {
		Test2View()
	}
}
