//
//  BckgroundView.swift
//  Bullseye
//
//  Created by Leonard Nucci de Oliveira on 25/12/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
            HStack {
                NumberView(title: "SCORE", text: String(game.score))
                Spacer()
                NumberView(title: "ROUND", text: String(game.round))
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title.uppercased())
            RoundRectTextView(text: text)
        }
    }
}

struct BckgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}