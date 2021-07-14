//
//  swift_demoApp.swift
//  swift_demo
//
//  Created by mac on 03/07/21.
//

import SwiftUI

@main
struct swift_demoApp: App {
    @StateObject var cart = Cart()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                Login().environmentObject(cart)
//                ContentView()
    //            ListView()
    //            ApiView()
//                BadgeSymbol()
            }
        }
    }
}
