//
//  MapKitSegmentControlApp.swift
//  MapKitSegmentControl
//
//  Created by Anthony on 12/07/21.
//

import SwiftUI

@main
struct MapKitSegmentControlApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
