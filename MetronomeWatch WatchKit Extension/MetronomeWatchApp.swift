//
//  MetronomeWatchApp.swift
//  MetronomeWatch WatchKit Extension
//
//  Created by Jonathan Andrei on 16/08/21.
//

import SwiftUI

@main
struct MetronomeWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
//                MetronomeView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
