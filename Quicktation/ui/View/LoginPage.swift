//
//  LoginPage.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 27.04.2023.
//

import SwiftUI

struct LoginPage: View {
    @Environment(\.presentationMode) var presentationmode
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ZStack{
                    Image("main.png")
                        .resizable(resizingMode: .stretch)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        LogoView()
                            .padding(.top, geometry.size.height * 0.15)
                            .padding(.bottom, geometry.size.height * 0.1)
                       
                            InputMailView(title: "E-mail" , text: $email)
                            .padding(.bottom, 20)
                            InputPassView(password: $password, title: "Şifre")
                            Spacer()
                        Button(action: {
                                    self.presentationmode.wrappedValue.dismiss()
                        }) {Text("Şifreni mi unuttun?")
                                .foregroundColor(.yellow)
                                .underline()
                                .font(.custom("OpenSans-Regular", size: 15))
                                .padding(.bottom, 10)
                        }
                        
                        HStack{
                            Text("Hesabın mı yok? Kayıt olmak için")
                                .foregroundColor(.white)
                                .font(.custom("OpenSans-Regular", size: 15))
                            Button(action: {
                                        self.presentationmode.wrappedValue.dismiss()
                            }) {Text("tıkla")
                                    .foregroundColor(.yellow)
                                    .underline()
                                    .font(.custom("OpenSans-Regular", size: 15))
                            }
                        }
                        Spacer()
                        LoginButton()
                        Spacer()
                        }
                    }
                }
            }
        }
    }


struct LogoView: View {
    var body: some View {
        Text("Quicktation")
            .foregroundColor(Color.white)
            .font(.custom("Aromatron-Regular", size: 36))
    }
}
struct InputMailView: View {
   
    var title: String
    @Binding var text: String
    var body: some View {
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
                    .font(.custom("OpenSans-Regular", size: 24))

                Divider()
                    .background(Color.white)
                    .padding(.horizontal, 25)
            }
        }
    }
}
struct LoginButton: View {
    var body: some View {
        Button(action: {}){
            Text("Giriş Yap")
                .frame(width: UIScreen.main.bounds.width * 0.9 ,height:  UIScreen.main.bounds.height * 0.1)
                .background(Color.green)
                .foregroundColor(.black)
                .font(.custom("Nunito-Bold", size: 36))
                .cornerRadius(15)
                .padding(.bottom,30)
                
        }
    }
}
struct InputPassView: View {
    @Binding var password: String
    var title: String = ""
    var body: some View {
        ZStack(alignment: .leading){
            if password.isEmpty {
                Text(title)
                    .foregroundColor(.white)
                    .font(.custom("OpenSans-Regular", size: 20))
                    .padding(.horizontal, 25)
            }
            VStack {
                SecureField(title, text: $password)
                    .padding(.horizontal, 25)
                    .foregroundColor(.white)
                    .font(.custom("OpenSans-Regular", size: 20))
                
                Divider()
                    .background(Color.white)
                    .padding(.horizontal, 25)
            }
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

