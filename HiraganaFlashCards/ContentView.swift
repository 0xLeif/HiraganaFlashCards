//
//  ContentView.swift
//  HiraganaFlashCards
//
//  Created by Zach Eriksen on 2/4/21.
//

import SwiftUI
import LearnHiragana

extension Hiragana {
    static var random: Hiragana {
        Hiragana.allCases.randomElement() ?? Hiragana.あ
    }
}

enum FlashCardSide {
    case front
    case back
}

struct CardImageView: View {
    @State var rotationAngle: Double = 0
    @State var hiragana: Hiragana = Hiragana.random
    
    private var stringHiragana: String {
        "\(hiragana)"
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Group {
                if self.rotationAngle > 90 && self.rotationAngle < 270 {
                    // Back
                    Text(hiragana.rawValue)
                        .rotation3DEffect(Angle(degrees: self.rotationAngle + 360),
                                                             axis: (x: 0, y: 1, z: 0))
                } else {
                    // Front
                    Text(stringHiragana)
                }
            }
            .font(.largeTitle)
            .padding(32)
            .background(Color.blue)
            .cornerRadius(8)
            .rotation3DEffect(Angle(degrees: self.rotationAngle),
                              axis: (x: 0, y: 1, z: 0))
            
            Spacer()
            
            Slider(value: $rotationAngle, in: 0 ... 360)
            
            Button("Next") {
                rotationAngle = 0
                hiragana = Hiragana.random
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
        CardImageView(hiragana: Hiragana.allCases.randomElement() ?? Hiragana.あ)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
