//
//  ContentView.swift
//  DungeonDice2
//
//  Created by Christian Manzaraz on 03/02/2025.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int {
        case four = 4, six = 6, eight = 8, ten = 10, twelve = 12, twenty = 20, hundred = 100
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }

    @State private var resultMessage = ""
    
    var body: some View {
        VStack {

            Text("Dungeon Dice")
                .font(.system(.largeTitle, weight: .black))
                .foregroundStyle(.red)
            
            Spacer()
            
            Text(resultMessage)
                .font(.system(.largeTitle, weight: .medium))
                .multilineTextAlignment(.center)
                .frame(height: 150)
            
            Spacer()
            Group {
                HStack {
                    Button("\(Dice.four.rawValue)-Sided") {
                        resultMessage = "You rolled a \(Dice.four.roll()) \non a \(Dice.four.rawValue)-sided dice"
                    }
                
                    Spacer()
                    
                    Button("\(Dice.six.rawValue)-Sided") {
                        resultMessage = "You rolled a \(Dice.six.roll()) \non a \(Dice.six.rawValue)-sided dice"
                    }
                    Spacer()
                    Button("\(Dice.eight.rawValue)-Sided") {
                        resultMessage = "You rolled a \(Dice.eight.roll()) \non a \(Dice.eight.rawValue)-sided dice"
                    }
                }
                
                HStack {
                    Button("\(Dice.ten.rawValue)-Sided") {
                        resultMessage = "You rolled a \(Dice.ten.roll()) \non a \(Dice.ten.rawValue)-sided dice"
                    }
                    Spacer()
                    Button("\(Dice.twelve.rawValue)-Sided") {
                        resultMessage = "You rolled a \(Dice.twelve.roll()) \non a \(Dice.twelve.rawValue)-sided dice"
                    }
                    Spacer()
                    Button("\(Dice.twenty.rawValue)-Sided") {
                        resultMessage = "You rolled a \(Dice.twenty.roll()) \non a \(Dice.twenty.rawValue)-sided dice"
                    }
                }
                Button("\(Dice.hundred.rawValue)-Sided") {
                    resultMessage = "You rolled a \(Dice.hundred.roll()) \non a \(Dice.hundred.rawValue)-sided dice"
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
        }
        .padding()
    }
    
    
}

#Preview {
    ContentView()
}
