//
//  ContentView.swift
//  DungeonDice2
//
//  Created by Christian Manzaraz on 03/02/2025.
//

import SwiftUI

struct ContentView: View {
    enum Dice: Int, CaseIterable {
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
                ForEach(Dice.allCases, id: \.self) { dice in
                    Button("\(dice.rawValue)-Sided") {
                        resultMessage = "You rolled a \(dice.roll()) \non a \(dice.rawValue)-sided dice"
                    }
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
