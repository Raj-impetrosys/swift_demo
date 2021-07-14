//
//  DetailView.swift
//  swift_demo
//
//  Created by mac on 06/07/21.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @StateObject var cart = Cart()
    var image: String
    var product:String
    var body: some View{
        VStack{
            Image(image).resizable().aspectRatio(contentMode: .fit)
            HStack{
                VStack(alignment:.leading){Text(product).font(.title).bold().foregroundColor(.red)
                    Text("by Seto")
                }
                Spacer()
                Text("$899").font(.title).bold().foregroundColor(.init(Color(red: 0.0, green: 0.0, blue: 0.4)))
            }.padding()
            Text("L'Oreal Paris Extraordinary Clay shampoo with 3 Refined Clays instantly purifies oily roots and hydrates dry lengths. This clarifying shampoo for oily roots and dry ends leaves hair looking beautifully fresh and clean from root to tip for up to 72 hours. Infused with the extraordinary power of pure clay, it makes your hair softer, shinier, and healthier. For best results, use L'Oreal Paris Extraordinary Clay pre-shampoo hair mask, shampoo and conditioner.").font(.subheadline).foregroundColor(.init(Color(white: 0.12))).padding().opacity(1)
            Spacer()
            Button("ADD TO CART"){
                print("Item added")
                cart.add(product: Cart1(id: UUID(), title: "T-shirt", price: 55.0, qty: 1, image: ""))
                print(cart.cart.count.description)
            }.padding().background(Color.black).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
            
//            NavigationLink(destination: CartView()){
//                Text("ADD TO CART")
//            }.padding().background(Color.black).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).onTapGesture {
//                print("Item added")
//                cart.add(product: "item")
//                print(cart.cart.count.description)
//            }
        }.environmentObject(cart)
    }
    
}

struct DetailView1: View {
    var image: String
    var product:String
    var price: Double
    var description: String
    var body: some View{
        VStack{
            UrlImage(url:image,placeholder: "photo").aspectRatio(contentMode: .fit)
//            Image(image).resizable().aspectRatio(contentMode: .fit)
            HStack{
                VStack(alignment:.leading){Text(product).font(.title).bold().foregroundColor(.red)
                    Text("by Seto").opacity(0.5)
                }
                Spacer()
                Text("$"+String(price)).font(.title).bold().foregroundColor(.init(Color(red: 0.0, green: 0.0, blue: 0.4)))
            }.padding()
            Text(description).font(.subheadline).foregroundColor(.init(Color(white: 0.12))).padding().opacity(1)
            Spacer()
            Button("ADD TO CART"){
                print("Item added")
            }.padding().background(Color.black).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
        }
    }
    
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: ContentView().products[4]["image"]!,product: ContentView().products[4]["products"]!)
    }
}
