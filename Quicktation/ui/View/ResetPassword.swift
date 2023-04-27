//
//  ResetPassword.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 27.04.2023.
//

import SwiftUI

struct ResetPassword: View {
    @State private var email: String = ""
    @State private var loginPageGo: Bool = false
    @Environment(\.presentationMode) var presentationmode
    var body: some View{
        GeometryReader { geometry in
            NavigationStack {
                ZStack{
                    Image("main.png")
                        .resizable(resizingMode: .stretch)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack{
                        logoView()
                            .padding(.top, geometry.size.height * 0.15)
                            .padding(.bottom, geometry.size.height * 0.1)
                            
                        CustomMailView(title: "E-mail" , text: $email)
                            .padding(.bottom, 50)
                        Button (action: {loginPageGo = true }) {
                            
                            Text("Giriş yapmayı dene!")
                                .foregroundColor(.yellow)
                                .font(.custom("OpenSans-Regular", size: 13 ))
                        }
                    
                            .padding(.bottom, 200)
                        resetPass()
                    }.sheet(isPresented: $loginPageGo){
                        LoginPage()
                    }
                }
            }
        }
    }
}
struct logoView: View {
    var body: some View{
        Text("Quicktation")
            .foregroundColor(.white)
            .font(.custom("Aromatron-Regular", size: 36))
    }
}
struct CustomMailView: View {
    var title: String
    @Binding var text: String
    var body: some View{
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(title)
                    .foregroundColor(.white)
                    .font(.custom("OpenSans-Regular", size: 20))
                    .padding(.horizontal, 25)
            }
            VStack(spacing: 0) {
                TextField("", text: $text)
                    .padding(.horizontal, 25)
                    .foregroundColor(.white)
                    .font(.custom("OpenSans-Regular", size: 20))
                    .keyboardType(.default)

                Divider()
                    .background(Color.white)
                    .padding(.horizontal, 25)
            }
        }
    }
}

struct resetPass: View{
    var body: some View {
        Button(action: {}){
            Text("Şifre mi unuttum ")
                .frame(width: UIScreen.main.bounds.width * 0.9 ,height:  UIScreen.main.bounds.height * 0.1)
                .background(Color.white)
                .foregroundColor(.black)
                .font(.custom("Nunito-Bold", size: 36))
                .cornerRadius(15)
                .padding(.bottom,30)
                
        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
