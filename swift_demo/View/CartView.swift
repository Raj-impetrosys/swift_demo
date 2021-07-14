//
//  CartView.swift
//  swift_demo
//
//  Created by mac on 08/07/21.
//

import Foundation
import SwiftUI
import MapKit

struct CartView: View {
    @StateObject var cart = Cart()
    var body: some View{
       ZStack{
        Color.black.opacity(0.1).ignoresSafeArea()
//        List(0..<cart.cart.count){product in
//            Text(product.description)
//        }
        Text(cart.cart.count.description)
        Button(action:{
            cart.add(product: Cart1(id: UUID(), title: "T-shirt", price: 55.0, qty: 1, image: ""))
        }){
            Image(systemName: "plus")
        }.foregroundColor(.black).padding().background(Color.white).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).frame(maxHeight: .infinity, alignment: .bottom)
       }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
