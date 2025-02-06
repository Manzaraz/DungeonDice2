//
//  ButtonLayoutView.swift
//  DungeonDice2
//
//  Created by Christian Manzaraz on 05/02/2025.
//

import SwiftUI

struct ButtonLayout: View {
    enum Dice: Int, CaseIterable {
        case four = 4,
             six = 6,
             eight = 8,
             ten = 10,
             twelve = 12,
             twenty = 20,
             fifty = 50,
             hundred = 100
        func roll() -> Int {
            return Int.random(in: 1...self.rawValue)
        }
    }
    
    struct DeviceWidthPreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = 0
        
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = nextValue()
        }
        
        typealias Value = CGFloat
    }
    
    @State private var buttonsLeftOver = 0 // # of buttons in less-than-full row8
    @Binding var resultMessage: String //
    
    let horizontalPadding: CGFloat = 16
    let spacing: CGFloat = 0 // Between buttons
    let buttonWidth: CGFloat = 102
    
    var body: some View {
        VStack {
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
        .overlay {
            GeometryReader { geo in
                Color.clear
                    .preference(key: DeviceWidthPreferenceKey.self, value: geo.size.width)
            }
        }
        .onPreferenceChange(DeviceWidthPreferenceKey.self) { deviceWidth in
            arrangeGridItems(deviceWidth: deviceWidth)
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

#Preview {
    ButtonLayout(resultMessage: .constant(""))
}
