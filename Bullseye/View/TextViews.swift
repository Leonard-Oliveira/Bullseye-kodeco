//
//  TextViews.swift
//  Bullseye
//
//  Created by Leonard Nucci de Oliveira on 19/12/22.
//

import SwiftUI

struct InstructionText: View {
    var body: some View {
        Text("🎯🎯🎯\nPut the bullseye as close as you can to.".uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        InstructionText()
    }
}
