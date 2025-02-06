//
//  ContentView.swift
//  DungeonDice2
//
//  Created by Christian Manzaraz on 03/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var resultMessage = ""
    
    var body: some View {
        VStack {
            titleView
            
            Spacer()
            
            resultMessageView
            
            Spacer()
            
            ButtonLayout(resultMessage: $resultMessage)
        }
        .padding()
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
