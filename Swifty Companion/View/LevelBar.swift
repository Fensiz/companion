//
//  LevelBarView.swift
//  Swifty Companion
//
//  Created by Симонов Иван Дмитриевич on 16.04.2023.
//

import SwiftUI

struct LevelBar: View {
	@State var value: Double
    var body: some View {
		ZStack {
			ProgressView(value: value.truncatingRemainder(dividingBy: 1))
				.padding(10)
				.accentColor(Color.green)
				.scaleEffect(x: 1, y: 4, anchor: .center)
				.shadow(color: Color.black.opacity(0.5), radius: 5, x: 10, y: 10)
			Text("Level \(Int(value)) \(Int(value.truncatingRemainder(dividingBy: 1) * 100))%")
		}
    }
}

struct LevelBar_Previews: PreviewProvider {
    static var previews: some View {
		LevelBar(value: 13.72)
    }
}
