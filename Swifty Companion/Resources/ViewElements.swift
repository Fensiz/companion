//
//  ViewElements.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 18.02.2023.
//

import SwiftUI

struct CompanionButton: View {
	var action: () -> Void
	var label: String = ""
	var colorFirst: UIColor = #colorLiteral(red: 0, green: 0.9581305385, blue: 0.6586436629, alpha: 1)
	var colorSecond: UIColor = #colorLiteral(red: 0, green: 0.5795812011, blue: 1, alpha: 1)

	var body: some View {
		Button(action: action) {
			Text(label)
				.frame(height: 50)
				.frame(maxWidth: 300)
				.padding(.horizontal)
				.foregroundColor(.white)
				.background(
					LinearGradient(
						colors: [.init(uiColor: colorFirst), .init(uiColor: colorSecond)],
						startPoint: .topLeading,
						endPoint: .bottomTrailing
					)
				)
				.cornerRadius(25)
		}
		.contentShape(RoundedRectangle(cornerRadius: 25))
	}
}

struct CompanionTextEdit: View {
	@Binding var text: String
	
	var body: some View {
		TextEditor(text: $text)
	}
}


