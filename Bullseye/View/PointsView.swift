//
//  PointsView.swift
//  Bullseye
//
//  Created by Leonard Nucci de Oliveira on 10/01/23.
//

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    
    VStack(spacing: 10){
      InstructionText(text: "The Slider value is")
      BigNumberText(text: String(roundedValue))
      BodyText(text: "you scored \(points) points \n🎉🎉🎉")
      Button(action: {
        withAnimation{
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      }) {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300.0, maxHeight: 300.0)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundedRectCornerRadius)
    .shadow(radius: Constants.General.roundedRectShadowRadius)
    .transition(.scale)
  }
}
struct PointsView_Previews: PreviewProvider {
  
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
  }
}
