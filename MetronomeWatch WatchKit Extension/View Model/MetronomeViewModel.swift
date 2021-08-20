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
    @Published var session: WKExtendedRuntimeSession?

    func timerConfig() { //Configuring timer
        
        startSession()
        
        self.metro.timer?.invalidate()
        self.metro.timer = Timer.scheduledTimer(withTimeInterval: self.metro.timeInterval, repeats: true) { timer in
            
            self.metro.beep.toggle()
            print("keluar")
            print(self.metro.beep)
            self.metro.objectWillChange.send()
            self.objectWillChange.send()
            
            WKInterfaceDevice.current().play(.click)//Playing haptic on beat
                
        }
        
    }

    func stopTimer() {//Stop timer
        
        endSession()
        
        self.metro.timer?.invalidate()
        print("Timer Stop")
    }
    
    func startSession() {//To make metronome working on background
        session = WKExtendedRuntimeSession()
        session?.start()
    }
    
    func endSession() {//To end background session
        session?.invalidate()
    }

}
