//
//  ContentView.swift
//  Bullseye
//
//  Created by Leonard Nucci de Oliveira on 08/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private  var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
            VStack {
                InstructionsView(game: $game)
                HStack {
                    Text("1")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                }
                Button(action: {  // ExtractView A
                    self.alertIsVisible = true
                }) {
                    Text("Hit Me".uppercased())
                        .bold()
                        .font(.title3)
                }
                    .padding(20)
                    .background(
                        ZStack {
                            Color("ButtonColor")
                            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                        }
                    )
                    .foregroundColor(.white)
                    .cornerRadius(21)
                    .alert(isPresented: $alertIsVisible, content: { //ExtractView
                        let roundedValue = Int(sliderValue.rounded())
                        return Alert(title: Text("hello there!"), message: Text("The slider value is: \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round."), dismissButton: .default(Text("Awesome!!")))
                }) // fim - Extract View A
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPut the bullseye as close as you can to.")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
