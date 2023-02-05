//
//  Eureka_picture_challegeApp.swift
//  Eureka_picture_challege
//
//  Created by Gastón Pena on 05/02/2023.
//

import SwiftUI

@main
struct Eureka_picture_challegeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .background(Color.white)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
