//
//  MetronomeView.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Jonathan Andrei on 18/08/21.
//

import SwiftUI

struct MetronomeView: View {
    
    @StateObject var metroVM: MetronomeViewModel = MetronomeViewModel()
//    @StateObject var metro: Metronome = Metronome()
    
    @State var bpm: Double = 10
    @State var isChanged: Bool = false
    @State var isEditing: Bool = true
    @State var scale: CGFloat = 1.0
    
//    init(){
//        self.metroVM.stopTimer()
//    }
    
    var body: some View {
        VStack(alignment: .center){
            Button(action: {
                
                self.isEditing.toggle()
                
                if isEditing == false { //Metronome Played
                    metroVM.timerConfig()
                } else {
                    metroVM.stopTimer()
                }
                
            }) {
                VStack {
                    Text("\(self.metroVM.metro.beatsPerMinute, specifier: "%.0f")")
                        .font(.title)
                        .fontWeight(.regular)
                        .focusable(true)
                        .digitalCrownRotation(self.$metroVM.metro.beatsPerMinute, from: 10, through: 300, by: 1, sensitivity: .high, isContinuous: false, isHapticFeedbackEnabled: true)
                        .foregroundColor(.white)
                    
                    Text("BPM")
                        .font(.caption)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                }
                .padding(35)
            }
            .clipShape(Circle())
            .buttonStyle(BorderedButtonStyle(tint: .blue.opacity(100)))
            .scaleEffect(CGSize(width: scale, height: scale), anchor: .center)
            .animation(.easeInOut)
            
            Spacer(minLength: 10
            )

            if isEditing == true {
                Text("Use crown to change BPM")
                    .font(.caption2)
                    .fontWeight(.light)
            }
                
        }
        .onChange(of: self.metroVM.metro.beatsPerMinute, perform: { value in
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

struct MetronomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetronomeView()
    }
}
