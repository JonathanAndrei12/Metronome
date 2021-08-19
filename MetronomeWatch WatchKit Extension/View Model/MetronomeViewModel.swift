//
//  MetronomeViewModel.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Jonathan Andrei on 19/08/21.
//

import Foundation
import WatchKit
//import CoreHaptics
//import Combine

class MetronomeViewModel: ObservableObject {
    
    @Published var metro: Metronome = Metronome()//Calling metronome model

    func timerConfig() { //Configuring timer
//        DispatchQueue.main.async {
            self.metro.timer?.invalidate()
            self.metro.timer = Timer.scheduledTimer(withTimeInterval: self.metro.timeInterval, repeats: true) { timer in
                self.metro.beep.toggle()
                print("keluar")
                print(self.metro.beep)
                self.metro.objectWillChange.send()
                self.objectWillChange.send()
                
                WKInterfaceDevice.current().play(.click)
                
            }
//        }
//        self.timer.connect().cancel()
//        self.timer = Timer.publish(every: metro.timeInterval, on: .main, in: .common).autoconnect()
    }

    func stopTimer() {
        self.metro.timer?.invalidate()
        print("Timer Stop")
    }
    
//    func timerConfig(isPlayed: Bool) {
//        while isPlayed == true {
//            DispatchQueue.main.asyncAfter(deadline: .now() + metro.timeInterval) {
//                self.metro.beep = true
//            }
//        } else {
//            self.metro.beep = fals
//        }
//    }

}
