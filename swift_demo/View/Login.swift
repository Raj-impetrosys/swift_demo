//
//  Login.swift
//  swift_demo
//
//  Created by mac on 07/07/21.
//

import Foundation
import SwiftUI

struct Login: View{
    init(){
            UINavigationBar.setAnimationsEnabled(true)
        }
    
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View{
//        NavigationView{
//            Color.black.opacity(0.0).ignoresSafeArea()
        ZStack{
            BadgeSymbol(x: 10, y: 100, width: 20, height: 20).animation(Animation.linear(duration: 5).repeatForever(autoreverses: true))
            BadgeSymbol(x: 200, y: 300, width: 30, height: 30).animation(Animation.linear(duration: 8).repeatForever(autoreverses: true))
            BadgeSymbol(x: 300, y: 400, width: 40, height: 40).animation(Animation.linear(duration: 6).repeatForever(autoreverses: true))
            BadgeSymbol(x: 250, y: 150, width: 60, height: 60).animation(Animation.linear(duration: 9).repeatForever(autoreverses: true))
        VStack{
                Image(systemName: "lock.shield").font(.system(size: 100)).foregroundColor(.init(Color(red: 0.0, green: 0.0, blue: 0.4))).padding(.vertical,50)
//                Spacer(minLength: 0)
                Text("Welcome to Saifty!").font(.largeTitle).foregroundColor(.init(Color(red: 0.0, green: 0.0, blue: 0.4))).fontWeight(.medium)
                Text("Keep your data safe!").font(.title2).foregroundColor(.black).opacity(0.7).padding()
                TextField(
                    "Email",
                    text: $email
                ) { isEditing in
                    //                        self.isEditing = isEditing
                } onCommit: {
                    //                        validate(name: username)
                }
                .autocapitalization(.none)
                .disableAutocorrection(true).padding(.all,15).background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3))).padding()
                
                SecureField(
                    "Password",
                    text: $password
                ){
                    
                }
//                { isEditing in
//                    //                        self.isEditing = isEditing
//                } onCommit: {
//                    //                        validate(name: username)
//                }
                .autocapitalization(.none)
                .disableAutocorrection(true).padding(.all,15).background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.3))).padding()
                NavigationLink(destination:ContentView()){
                    Text("Login").fontWeight(.medium)
                        .frame(width: 360, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .background(Color(red: 0.0, green: 0.0, blue: 0.4))
                        .cornerRadius(5)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding()
                }.animation(.none)
                Text("Forgot Password?").foregroundColor(.init(Color(red: 0.0, green: 0.0, blue: 0.4)))
                Spacer()
                HStack{
                    Text("Don't have an account?").foregroundColor(.black).opacity(0.8)
                    Text("Register!").foregroundColor(.init(Color(red: 0.0, green: 0.0, blue: 0.4)))
                }
                
            }.padding().navigationBarHidden(true)
//        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
    }
}
}


struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
