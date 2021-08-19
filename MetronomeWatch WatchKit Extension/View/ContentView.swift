//
//  ContentView.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Jonathan Andrei on 16/08/21.
//

import SwiftUI
import WatchKit

struct ContentView: View {

    @StateObject var metroVM: MetronomeViewModel = MetronomeViewModel()
    
    @State var color: Color = .blue
    @State var isEditing: Bool = true
    @State var scale: CGFloat = 1.0
    @State var focus: Bool = true
    
    var body: some View {
        VStack(alignment: .center){
            Button(action: {
                self.isEditing.toggle()
                if isEditing == false { //Metronome Played
                    self.focus = false
                    self.metroVM.timerConfig()
                } else {
                    self.focus = true
                    self.metroVM.stopTimer()
                }
            }) {
                VStack {
                    Text("\(self.metroVM.metro.beatsPerMinute, specifier: "%.0f")")
                        .font(.title)
                        .fontWeight(.regular)
                        .focusable(focus)
                        .digitalCrownRotation(self.$metroVM.metro.beatsPerMinute, from: 10, through: 300, by: 1, sensitivity: .medium, isContinuous: false, isHapticFeedbackEnabled: true)
                        .foregroundColor(.white)
                    
                    Text("BPM")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                .padding(35)
            }
            .clipShape(Circle())
            .buttonStyle(BorderedButtonStyle(tint: color.opacity(100)))
            .scaleEffect(CGSize(width: scale, height: scale), anchor: .center)
            .animation(.easeInOut)
            
            Spacer(minLength: 10)

            if isEditing == true {
                Text("Use crown to change BPM")
                    .font(.caption2)
                    .fontWeight(.light)
            }
                
        }
        .onChange(of: self.metroVM.metro.beatsPerMinute, perform: { value in
            self.metroVM.metro.isBPMChanged = true
        })
        .onChange(of: self.metroVM.metro.isBPMChanged, perform: { value in
            if value == true {
                scale = 0.9
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.metroVM.metro.isBPMChanged.toggle()
                }
            } else {
                scale = 1.0
            }
        })
        .onChange(of: self.metroVM.metro.beep) { value in
            if value == true {
                scale = 0.9
                color = .red
            } else {
                scale = 1.0
                color = .blue
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
