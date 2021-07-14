//
//  CartModel.swift
//  swift_demo
//
//  Created by mac on 08/07/21.
//

import Foundation
import SwiftUI
import UIKit

class Cart: ObservableObject{
    @Published var cart: Array<Cart1> = []
    
    func add(product:Cart1){
        cart.append(Cart1(id: UUID(), title: "T-shirt", price: 55.0, qty: 1, image: ""))
        print(cart)
    }
}
 
//public struct Cart1: Model{
//
//}

struct Cart1: Identifiable {
    var id: UUID = UUID()
    var title: String
    var price: Double
    var qty: Int8
    var image: String
}
