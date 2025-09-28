//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Sergey on 31.08.2025.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
       #if os(macOS)
       Settings {
           LandmarkSettings()
       }
       #endif
    }
}
