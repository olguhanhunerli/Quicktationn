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
    @State private var resetPass: Bool = false
    @State private var registerPageGo: Bool  = false
    @State private var showalert: Bool = false
    @State private var alertMessage: String = ""
    @State private var alertTitle: String = ""
    @State private var homepageGo: Bool = false
    @ObservedObject var loginViewModel = LoginViewModel()
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
                                    resetPass = true
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
                                        registerPageGo = true
                                    }) {Text("tıkla")
                                            .foregroundColor(.yellow)
                                            .underline()
                                            .font(.custom("OpenSans-Regular", size: 15))
                                    }
                                }
                                Spacer()
                                LoginButton(action: { errorMessage, errorCode in
                                    if errorCode == "0" {
                                        print("Başarılı")
                                        alertTitle = "Başarılı"
                                        alertMessage = "Giriş başarılı"
                                        showalert = true
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            homepageGo = true
                                        }
                                    } else {
                                        print("Başarısız")
                                        alertTitle = "Hata"
                                        alertMessage = errorMessage ?? "Bir hata oluştu."
                                        showalert = true
                                    }
                                }, loginViewModel: loginViewModel, email: $email, password: $password)
                                
                                Spacer()
                            }.sheet(isPresented: $resetPass){
                                ResetPassword()
                            }.sheet(isPresented: $registerPageGo){
                                RegisterPage()
                            }.sheet(isPresented: $homepageGo) {
                                HomePageView()}
                            .alert(isPresented: $showalert) {
                                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Tamam")))
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
            let action: (String?, String?) -> Void
            @ObservedObject var loginViewModel : LoginViewModel
            @Binding var email: String
            @Binding var password: String
            var body: some View {
                Button(action: {
                    loginViewModel.login.email = email
                    loginViewModel.login.password = password
                    loginViewModel.loginUser { errorMessage, errorCode in
                        action(errorMessage, errorCode)
                    }
                }) {
                    Text("Giriş Yap")
                        .frame(maxWidth: 306,maxHeight: 71)
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
        
    }


