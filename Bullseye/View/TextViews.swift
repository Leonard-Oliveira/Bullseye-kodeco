//
//  TextViews.swift
//  Bullseye
//
//  Created by Leonard Nucci de Oliveira on 19/12/22.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .bold()
      .kerning(2.0)
      .multilineTextAlignment(.center)
      .lineSpacing(4)
      .font(.footnote)
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.General.sliderLabelTextViewFrame)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .kerning(1.5)
      .bold()
      .font(.caption)
      .foregroundColor(Color("TextColor"))
  }
}

struct BodyText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.semibold)
      .font(.subheadline)
      .multilineTextAlignment(.center)
      .lineSpacing(12.0)
  }
}

struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .fontWeight(.bold)
      .font(.body)
      .foregroundColor(Color("ButtonTextColor"))
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.accentColor)
      .cornerRadius(Constants.General.buttonTextViewCornerRadius)
  }
}

struct ScoreText: View {
  var score: Int
  
  var body: some View {
    Text(String(score))
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

struct DateText: View {
  var date: Date
  
  var body: some View {
    Text(date, style: .time)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

struct BigBoldText: View {
  let text: String
  
  var body: some View {
    Text(text.uppercased())
      .kerning(2.0)
      .foregroundColor(Color("TextColor"))
      .font(.title)
      .fontWeight(.black)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "999")
      SliderLabelText(text: "100")
      LabelText(text: "99")
      BodyText(text: "You scored 200 points \n🎉🎉🎉")
      ButtonText(text: "Start New Round")
      ScoreText(score: 459)
      DateText(date: Date())
      BigBoldText(text: "Leaderboard")
    }
    .padding()
  }
}
