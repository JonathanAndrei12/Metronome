//
//  MetronomeView.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Jonathan Andrei on 18/08/21.
//

import SwiftUI

struct MetronomeView: View {
    
    @State var BPM: Double = 10
    @State var isEditing: Bool = true
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack(alignment: .center) {
                Button(action: {
                    self.isEditing.toggle()
                }){
                    Text("\(BPM, specifier: "%.0f")")
                        .digitalCrownRotation($BPM, from: 10.0, through: 300.0, by: 1, sensitivity: .high, isContinuous: false, isHapticFeedbackEnabled: true)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(40)
                }
                .clipShape(Circle())
                .buttonStyle(BorderedButtonStyle(tint: .blue.opacity(100)))
                .animation(.easeInOut)
                
    //            Text("\(BPM, specifier: "%.0f")")
    //                .digitalCrownRotation($BPM, from: 10.0, through: 300.0, by: 1, sensitivity: .high, isContinuous: false, isHapticFeedbackEnabled: true)
            }
            
            Slider(value: $BPM, in: 10...300, step: 1)
                .isHidden(true)
        }
    }
}

struct MetronomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetronomeView()
    }
}
