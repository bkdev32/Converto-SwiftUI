//
//  Converto_SwiftUIApp.swift
//  Converto-SwiftUI
//
//  Created by Burhan Kaynak on 09/06/2021.
//

import SwiftUI

@main
struct Converto_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(currency: DataModel(rate: 0.00, currency: ""))
        }
    }
}
