//
//  ContentView.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Jonathan Andrei on 16/08/21.
//

import SwiftUI
import WatchKit

struct ContentView: View {
    
    @State var bpm: Double = 10
    @State var isChanged: Bool = false
    @State var isEditing: Bool = true
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack(alignment: .center){
            Button(action: {
                self.isEditing.toggle()
            }) {
                Text("\(bpm, specifier: "%.0f")")
                    .digitalCrownRotation($bpm, from: 10, through: 300, by: 1, sensitivity: .medium, isContinuous: false, isHapticFeedbackEnabled: true)
                    .foregroundColor(.white)
                    .padding(40)
                    .font(.title)
            }
            .clipShape(Circle())
            .buttonStyle(BorderedButtonStyle(tint: .blue.opacity(100)))
            .animation(.easeInOut)
            .scaleEffect(CGSize(width: scale, height: scale), anchor: .center)
            
            Spacer(minLength: 20)
            
            if isEditing == true {
//                Text("Use crown to set BPM")
//                    .font(.caption2)
//                    .animation(/*@START_MENU_TOKEN@*/.easeInOut/*@END_MENU_TOKEN@*/)
//                ZStack{
                    Slider(
                        value: $bpm,
                        in: 10...300,
                        step: 1
                    )
                    .padding(.horizontal, 10)
//                }
                    
            }
                
        }
        .onChange(of: bpm, perform: { value in
            isChanged = true
        })
        .onChange(of: isChanged, perform: { value in
            if value == true {
                scale = 0.8
             
                self.isChanged.toggle()
            } else {
                scale = 1.0
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
