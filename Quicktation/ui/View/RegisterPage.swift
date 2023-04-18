//
//  RegisterPage.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 5.04.2023.
//

import SwiftUI

struct RegisterPage: View {
    @State private var nameSurname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    @State private var contentView : Bool = false
    @State private var circleSelected = false
    @State private var circleSelected2 = false
    @Environment(\.presentationMode) var presentationmode
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Image ("main.png")
                    .resizable(resizingMode: .stretch)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Text("Quicktation")
                    .foregroundColor(Color.white)
                    .font(.custom("Aromatron-Regular", size:36))
                    .padding(.bottom, UIScreen.main.bounds.height * 0.85)
                VStack{
                    ZStack{
                        if nameSurname.isEmpty {
                            Text ("Ad Soyad")
                                .foregroundColor(.white)
                                .padding(.bottom , UIScreen.main.bounds.height * 0.55)
                                .padding(.trailing, UIScreen.main.bounds.height * 0.31)
                                .font(.custom("OpenSans-Regular", size: 20))
                        }
                        TextField("", text: $nameSurname)
                            .textFieldStyle(MyStyle())
                            .padding(.bottom , UIScreen.main.bounds.height * 0.55)
                            .padding(.leading , 25)
                        Rectangle()
                            .frame(height: 2.0, alignment: .bottom)
                            .padding(.bottom, UIScreen.main.bounds.width * 0.9)
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 25)
                        ZStack{
                            if email.isEmpty {
                                Text ("Email")
                                    .foregroundColor(.white)
                                    .padding(.bottom , UIScreen.main.bounds.height * 0.43)
                                    .padding(.trailing, UIScreen.main.bounds.height * 0.35)
                                    .font(.custom("OpenSans-Regular", size: 20))
                                
                            }
                            TextField("", text: $email)
                                .textFieldStyle(MyStyle())
                                .padding(.bottom , UIScreen.main.bounds.height * 0.40)
                            
                            Rectangle()
                                .frame(height: 2.0, alignment: .bottom)
                                .padding(.bottom, UIScreen.main.bounds.height * 0.38)
                                .foregroundColor(Color.white)
                            
                                .padding(.horizontal, 25)
                            
                        }
                        ZStack{
                            if password.isEmpty {
                                Text ("Şifre")
                                    .foregroundColor(.white)
                                    .padding(.bottom , UIScreen.main.bounds.height * 0.30)
                                    .padding(.trailing, UIScreen.main.bounds.height * 0.36)
                                    .font(.custom("OpenSans-Regular", size: 20))
                                
                            }
                            SecureField("", text: $password)
                            
                                .colorMultiply(.white)
                                .textFieldStyle(MyStyle())
                                .padding(.bottom , UIScreen.main.bounds.height * 0.40)
                                .padding(.leading , 25)
                            Rectangle()
                                .frame(height: 2.0, alignment: .bottom)
                                .padding(.bottom, UIScreen.main.bounds.height * 0.25)
                                .foregroundColor(Color.white)
                            
                                .padding(.horizontal, 25)
                        }
                        ZStack{
                            if password2.isEmpty {
                                Text ("Şifre (Tekrar)")
                                    .foregroundColor(.white)
                                    .padding(.bottom , UIScreen.main.bounds.height * 0.19)
                                    .padding(.trailing, UIScreen.main.bounds.height * 0.28)
                                    .font(.custom("OpenSans-Regular", size: 20))
                                
                            }
                            SecureField(" ", text: $password2)
                                .textFieldStyle(MyStyle())
                                .padding(.bottom , UIScreen.main.bounds.height * 0.15)
                                .padding(.leading , 25)
                            
                            Rectangle()
                                .frame(height: 2.0, alignment: .bottom)
                                .padding(.bottom, UIScreen.main.bounds.height * 0.13)
                                .foregroundColor(Color.white)
                            
                                .padding(.horizontal, 25)
                            
                        }
                        Spacer()
                        
                        VStack{
                            ZStack{
                                ZStack{
                                    Button(action: toggleSelectedCircle) {
                                        ZStack {
                                            Circle()
                                                .fill(circleSelected ? Color.green : Color.white)
                                                .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                                .frame(width: UIScreen.main.bounds.width * 0.08)
                                        }
                                    }
                                    .padding(.trailing, UIScreen.main.bounds.width * 0.8)
                                    .padding(.top, UIScreen.main.bounds.width * 0.2)
                                    HStack{
                                        Button(action: { } ){
                                            Text("Sözleşmeyi")
                                                .foregroundColor(.yellow)
                                                .font(.custom("OpenSans-Regular", size: 15))
                                                .padding(.top , UIScreen.main.bounds.width * 0.2)
                                            Text ("okudum,anladım kabul ediyorum")
                                                .foregroundColor(.white)
                                                .font(.custom("OpenSans-Regular", size: 15))
                                                .padding(.top , UIScreen.main.bounds.width * 0.2)
                                        }
                                    }
                                }
                                
                                .padding(.top, UIScreen.main.bounds.width * 0.1)
                                
                                VStack {
                                    ZStack{
                                        ZStack {
                                            Button(action: toggleSelectedCircle2) {
                                                ZStack {
                                                    Circle()
                                                        .fill(circleSelected2 ? Color.green : Color.white)
                                                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                                                        .frame(width: UIScreen.main.bounds.width * 0.08)
                                                }
                                            }
                                            .padding(.trailing, UIScreen.main.bounds.width * 0.8)
                                            .padding(.top, UIScreen.main.bounds.width * 0.05)
                                            HStack{
                                                Button(action: { } ){
                                                    Text("Sözleşmeyi")
                                                        .foregroundColor(.yellow)
                                                        .font(.custom("OpenSans-Regular", size: 15))
                                                        .padding(.top , UIScreen.main.bounds.width * 0.07)
                                                    Text ("okudum,anladım kabul ediyorum")
                                                        .foregroundColor(.white)
                                                        .font(.custom("OpenSans-Regular", size: 15))
                                                        .padding(.top , UIScreen.main.bounds.width * 0.07)
                                                    
                                                }
                                            }
                                            VStack{
                                                
                                                Button(action: {
                                                    self.presentationmode.wrappedValue.dismiss()
                                                }) {
                                                    Text("Zaten hesabın var mı? Giriş yap")
                                                        .padding(.top, UIScreen.main.bounds.width * 0.9)
                                                        .foregroundColor(.yellow)
                                                    
                                                }
                                                .padding(.top, UIScreen.main.bounds.width * 0.5)
                                                
                                                Button("Kayıt Ol") {
                                                    
                                                }
                                                .frame(width: UIScreen.main.bounds.width * 0.9 , height: UIScreen.main.bounds.height * 0.1)
                                                .background(Color.white)
                                                .foregroundColor(.black)
                                                .font(.custom("Nunito-Bold", size: 36))
                                                .cornerRadius(15)
                                                .padding (.top, UIScreen.main.bounds.width * 0.1)
                                            }
                                        }
                                        
                                    }
                                }
                                
                                
                            }
                        }
                    }
                }
                
            }
        }
        
    }
    func toggleSelectedCircle() -> Void  {
        circleSelected.toggle()
        
    }
    func toggleSelectedCircle2() -> Void  {
        
        circleSelected2.toggle()
    }
    
    
    struct MyStyle : TextFieldStyle {
        
        
        
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .foregroundColor(.white)
                .font(.custom("OpenSans-Regular", size: 20))
                .textContentType(.password)
            
            
        }
    }
    
    struct RegisterPage_Previews: PreviewProvider {
        static var previews: some View {
            RegisterPage()
        }
    }
    
    
    
    
    
    
}
