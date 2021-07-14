//
//  ContentView.swift
//  swift_demo
//
//  Created by mac on 03/07/21.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    //    var products: [String:[String]] = ["image":["1", "2", "3", "4","5","6"],"products":["Moisturizer","Aloe-vera Gel","Beauty Products","Facewash","Hair gel"]]
    var products: [[String:String]] = [
        ["image":"1","products":"Moisturizer"], ["image":"2","products":"Aloe-vera Gel"], ["image":"3","products":"Beauty Products"], ["image":"4","products":"Facewash"], ["image":"5","products":"Hair gel"], ["image":"6","products":"Skin Care"]]
    var products1: [[String:String]] = [
        ["image":"https://freepngimg.com/thumb/dress%20shirt/4-black-dress-shirt-png-image-thumb.png","products":"Black shirt"], ["image":"https://rukminim1.flixcart.com/image/800/960/k3ahbww0/t-shirt/e/r/e/xs-sky-hs-si-lg-nb-xs-skyben-original-imafmg6cbhachmmz.jpeg?q=50","products":"Round neck"], ["image":"https://cdn.shopify.com/s/files/1/1464/5034/products/LUX-DCSS-LAYERED_FOREST_SAND_540x.jpg?v=1610743427","products":"T-shirt green"], ["image":"https://rukminim1.flixcart.com/image/800/960/kim1aq80-0/shirt/3/h/r/m-skcsh-1106-mao-fubar-original-imafycz57zg2hdnm.jpeg?q=50","products":"Black T-shirt"], ["image":"https://rukminim1.flixcart.com/image/800/960/kqb8pzk0/shirt/k/d/2/m-skcsh-1106-rb-fubar-original-imag4dfea8qncysv.jpeg?q=50","products":"Blue T-shirt"], ["image":"https://cdn.shopify.com/s/files/1/1464/5034/products/MEN_S_D.C._SS_V2-BLACK_6316717e-7d0b-4f69-bd12-7b046d800714_540x.jpg?v=1624465435","products":"Men Black"]
    ]
    
    let screenSize = UIScreen.main.bounds
    
    @ObservedObject var fetch = FetchProducts()
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.1).ignoresSafeArea()
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading) {
                    TopBarView(image: "images",icon: "cart.badge.plus")
                    TitleSubtitleView(title: "Trending Shop", subtitle: "Get popular fashion from home")
                    SearchBarView(search: $search)
                    SubtitleView(subtitle: "Categories")
                    CategoryScrollView(products: products)
                    SubtitleView(subtitle: "Products").padding(.top)
                    CategoryScrollView1(products1: products1)
                    SubtitleView(subtitle: "Products List").padding(.top)
                    ProductList().padding(.bottom, 100)
                    
                }.navigationBarHidden(true)//.overlay(BottomNavigationView(), alignment: .bottom)
            }.padding(.horizontal,20)
            BottomNavigationView().frame(maxHeight: .infinity, alignment: .bottom)
    
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
            }
        }
    }
}

struct TopBarView: View {
    var image: String
    var icon: String
    var body: some View {
        HStack{
            Image(image).resizable().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).shadow(radius: 50).scaledToFit().frame(width: 100, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            NavigationLink(destination:CartView()){ZStack{Image(systemName: icon).frame(width: 50, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).font(.system(size: 25))
                Text("0").padding(.all,5).foregroundColor(.white).background(Color.red).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).padding(.init(top: 0.5, leading: 30, bottom: 20, trailing: 0))
            }
            }.foregroundColor(.black)
        }.padding(.zero)
    }
}

struct TitleSubtitleView: View {
    var title: String
    var subtitle: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).foregroundColor(.black).font(.system(size: 25, weight: .medium))
            Text(subtitle)
                .font(.system(size: 15, weight: .regular, design: .default)).padding(.bottom)
        }
    }
}

struct SearchBarView: View {
    @Binding var search: String
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass").foregroundColor(.pink)
            TextField(
                "Search anything you like",
                text: $search
            ) { isEditing in
                //                        self.isEditing = isEditing
            } onCommit: {
                //                        validate(name: username)
            }
            .autocapitalization(.none)
            .disableAutocorrection(true)}.padding(.all,10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(1)))
    }
}

struct SubtitleView: View {
    var subtitle: String
    var body: some View {
        HStack{
            Text(subtitle).font(.system(size: 16, weight: .medium, design: .default))
            Spacer()
            Text("See all").font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.red)                }.padding(.vertical)
    }
}

struct CategoryScrollView: View {
    var products:[[String:String]]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:10){
                ForEach(products,id: \.self){product in
                    NavigationLink(
                        destination: DetailView(image: product["image"]!,product: product["products"]!)){
                        VStack{
                            Image(product["image"]!).resizable().aspectRatio(contentMode: .fit).frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Spacer()
                            Text(product["products"]!).font(.system(size:15))
                        }.frame(width:100,height:100).padding().background(RoundedRectangle(cornerRadius: 20).fill(Color.white))}.foregroundColor(.black).animation(.none)
                }
            }
        }
    }
}

struct CategoryScrollView1: View {
    var products1:[[String:String]]
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:10){
                ForEach(products1,id: \.self){product in
                    NavigationLink(
                        destination: DetailView1(image: product["image"]!,product: product["products"]!,price: 599,
                                                 description:"L'Oreal Paris Extraordinary Clay shampoo with 3 Refined Clays instantly purifies oily roots and hydrates dry lengths. This clarifying shampoo for oily roots and dry ends leaves hair looking beautifully fresh and clean from root to tip for up to 72 hours. Infused with the extraordinary power of pure clay, it makes your hair softer, shinier, and healthier. For best results, use L'Oreal Paris Extraordinary Clay pre-shampoo hair mask, shampoo and conditioner.")){
                        VStack{
                            UrlImage(url:product["image"]!,placeholder: "photo").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).aspectRatio(contentMode:.fit)
                            Spacer()
                            Text(product["products"]!).font(.system(size:15))
                        }.frame(width:100,height:100).padding().background(RoundedRectangle(cornerRadius: 20).fill(Color.white))}.foregroundColor(.black).animation(.none)
                }
            }
        }
    }
}

struct ProductList: View {
    @ObservedObject var fetch = FetchProducts()
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:10){
                ForEach(fetch.productList,id: \.id){product in
                    NavigationLink(
                        destination: DetailView1(image: product.image,product: product.title,price: product.price,description:product.description)){
                        VStack{
                            UrlImage(url:product.image,placeholder: "photo").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).aspectRatio(contentMode:.fit)
                            Spacer()
                            Text(product.title).font(.system(size:15))
                        }.frame(width:100,height:100).padding().background(RoundedRectangle(cornerRadius: 20).fill(Color.white))}.foregroundColor(.black).animation(.none)
                }
            }
        }
    }
}

struct AwesomeButton: View {
    var body: some View {
        HStack{
            Spacer()
            NavigationLink(destination: ListView()) {
                Text("Awesome Button")
                    .frame(minWidth: 0, maxWidth: 200)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .font(.headline)}
            Spacer()
        }
    }
}

struct BottomNavigationView: View {
    var body: some View {
        HStack{
//            Spacer()
//            NavigationLink(destination: ApiView()){
//                Text("API").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40).foregroundColor(.white)
//            }.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .leading, endPoint: .trailing))
//            .cornerRadius(40).animation(.none)
//            Spacer()
//            NavigationLink(destination: ListView()) {
//                Text("List").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40).foregroundColor(.white)
//            }.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .leading, endPoint: .trailing))
//            .cornerRadius(40).animation(.none)
//            Spacer()
//            NavigationLink(destination: Login()) {
//                Text("Login").frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40).foregroundColor(.white)
//            }.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .leading, endPoint: .trailing))
//            .cornerRadius(40).animation(.none)
//            Spacer()
//            NavigationLink(destination: BadgeSymbol(x: 50, y: 100, width: 50, height: 50)) {
//                Text("Animation").frame(width: 100, height: 40).foregroundColor(.white)
//            }.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .leading, endPoint: .trailing))
//            .cornerRadius(40).animation(.none)
//            Spacer()
            NavigationLink(destination:Login()){
                Image(systemName: "person")
            }.foregroundColor(.black).padding().background(Color.white).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).animation(.none)
            NavigationLink(destination:ApiView()){
                Image(systemName: "list.bullet")
            }.foregroundColor(.black).padding().background(Color.white).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).animation(.none)
            NavigationLink(destination:ListView()){
                Image(systemName: "house")
            }.foregroundColor(.black).padding().background(Color.white).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).animation(.none)
            NavigationLink(destination:BadgeBackground()){
                Image(systemName: "lasso")
            }.foregroundColor(.black).padding().background(Color.white).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).animation(.none)
            NavigationLink(destination:BadgeSymbol(x: 200, y: 400, width: 50, height: 50)){
                Image(systemName: "paperplane")
            }.foregroundColor(.black).padding().background(Color.white).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).animation(.none)
        }.padding(.horizontal)
    }
}
