//
//  ContentView.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Jonathan Andrei on 16/08/21.
//

import SwiftUI
import WatchKit

struct ContentView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
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
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.regular)
                    .digitalCrownRotation($bpm, from: 10, through: 300, by: 1, sensitivity: .high, isContinuous: false, isHapticFeedbackEnabled: true)
                    .foregroundColor(.white)
                    .padding(40)
            }
            .clipShape(Circle())
            .buttonStyle(BorderedButtonStyle(tint: .blue.opacity(100)))
            .scaleEffect(CGSize(width: scale, height: scale), anchor: .center)
            .animation(.easeInOut)
            
            Spacer(minLength: 20)
            
            if isEditing == true {
                    Slider(
                        value: $bpm,
                        in: 10...300,
                        step: 1
                    )
                    .accentColor(.clear)
                    .padding(.horizontal, 10)
            }
                
        }
        .onChange(of: bpm, perform: { value in
            isChanged = true
        })
        .onChange(of: isChanged, perform: { value in
            if value == true {
                scale = 0.9
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.isChanged.toggle()
                }
            } else {
                scale = 1.0
            }
        })
    }
}

//struct GradientButtonStyle: ButtonStyle {
//    func makeBody(configuration: Self.Configuration) -> some View {
//        configuration.label
//            .foregroundColor(Color.white)
//            .padding()
//            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom))
//            .cornerRadius(15.0)
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
