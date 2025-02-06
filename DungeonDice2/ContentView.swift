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
    @State private var buttonsLeftOver = 0 // # of buttons in less-than-full row
    
    let horizontalPadding: CGFloat = 16
    let spacing: CGFloat = 0 // Between buttons
    let buttonWidth: CGFloat = 102
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                titleView
                
                Spacer()
                
                resultMessageView
                
                Spacer()
                
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: buttonWidth), spacing: spacing)], alignment: .center) {
                    ForEach(Dice.allCases.dropLast(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-Sided") {
                            resultMessage = "You rolled a \(dice.roll()) \non a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                
                HStack {
                    ForEach(Dice.allCases.suffix(buttonsLeftOver), id: \.self) { dice in
                        Button("\(dice.rawValue)-Sided") {
                            resultMessage = "You rolled a \(dice.roll()) \non a \(dice.rawValue)-sided dice"
                        }
                        .frame(width: buttonWidth)
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                
            }
            .padding()
            .onChange(of: geo.size.width, {
                arrangeGridItems(deviceWidth: geo.size.width)
            })
            .onAppear {
                arrangeGridItems(deviceWidth: geo.size.width)
            }
        }
    }
    
    
    func arrangeGridItems(deviceWidth: CGFloat) {
        var screenWidth = deviceWidth - horizontalPadding*2 //  Padding on both sides
        if Dice.allCases.count > 1 {
            screenWidth += spacing
        }
        // Calculate numberOfButtonPerRow as an Int
        let numberOfButtonsPerRow = Int(screenWidth) / Int(buttonWidth + spacing)
        buttonsLeftOver = Dice.allCases.count % numberOfButtonsPerRow
    }
}


extension ContentView {
    private var titleView: some View {
        Text("Dungeon Dice")
            .font(.system(.largeTitle, weight: .black))
            .foregroundStyle(.red)
    }
    
    private var resultMessageView: some View {
        Text(resultMessage)
            .font(.system(.largeTitle, weight: .medium))
            .multilineTextAlignment(.center)
            .frame(height: 150)
    }
}


#Preview {
    ContentView()
}
