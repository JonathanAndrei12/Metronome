//
//  Metronome.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Jonathan Andrei on 19/08/21.
//

import Foundation

class Metronome: ObservableObject {
    @Published var beatsPerMinute: Double = 10
    @Published var beep: Bool = false
    @Published var isBPMChanged: Bool = false
    var timer: Timer?
    let granularity: Double = 4.0 //Using Quarterbeat (Standard)
    
    var timeInterval: TimeInterval { //Beat time interval
        return 1 / ((beatsPerMinute / 60.0) * granularity)
    }
}
