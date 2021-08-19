//
//  BeatIseng.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Zefanya Sharon on 19/08/21.
//

import SwiftUI
import WatchKit
import CoreHaptics


struct BeatIseng: View {
    let generator = UINotificationFeedbackGenerator()
    var body: some View {
        VStack(alignment: .center, spacing: 30.0) {
                   Button(action: {
                       self.generator.notificationOccurred(.success)
                   }) {
                       Text("Notification - Success")
                   }
                   
                   Button(action: {
                       self.generator.notificationOccurred(.error)
                   }) {
                       Text("Notification - Error")
                   }
                   
                   Button(action: {
                       self.generator.notificationOccurred(.warning)
                   }) {
                       Text("Notification - Warning")
                   }
                   
                   Button(action: {
                       let impactLight = UIImpactFeedbackGenerator(style: .light)
                       impactLight.impactOccurred()
                   }) {
                       Text("Impact - Light")
                   }
                   
                   Button(action: {
                       let impactMed = UIImpactFeedbackGenerator(style: .medium)
                       impactMed.impactOccurred()
                   }) {
                       Text("Impact - Medium")
                   }
                   
                   Button(action: {
                       let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                       impactHeavy.impactOccurred()
                   }) {
                       Text("Impact - Heavy")
                   }
                   
                   Button(action: {
                       let selectionFeedback = UISelectionFeedbackGenerator()
                       selectionFeedback.selectionChanged()
                   }) {
                       Text("Selection Feedback - Changed")
                   }
               }
               .padding(.all, 30.0)
    }
}

struct BeatIseng_Previews: PreviewProvider {
    static var previews: some View {
        BeatIseng()
    }
}
