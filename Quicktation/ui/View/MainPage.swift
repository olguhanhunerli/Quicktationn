
//
//  ContentView.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 5.04.2023.
//

import SwiftUI

struct MainPage: View {
    @State private var registerpageGo = false
    @State private var loginpageGo = false
    var body: some View {
        NavigationStack{
            ZStack {
                
                Image("main.png")
                    .resizable(resizingMode: .stretch)
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    
                VStack{
                    
                    Text("Quicktation")
                        .foregroundColor(Color.white)
                        .font(.custom("Aromatron-Regular", size:36))
                        .padding(.bottom, 300.0)
                    
                    
                    Button("Giriş Yap") {
                        loginpageGo = true
                        
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9 ,height:  UIScreen.main.bounds.height * 0.1)
                    .background(Color.green)
                    .foregroundColor(.black)
                    .font(.custom("Nunito-Bold", size: 36))
                    .cornerRadius(15)
                    .padding(.bottom,30)
                    
                    Button("Kayıt Ol") {
                        registerpageGo = true
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.9 , height: UIScreen.main.bounds.height * 0.1)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .font(.custom("Nunito-Bold", size: 36))
                    .cornerRadius(15)
                    .padding (.bottom, UIScreen.main.bounds.width * 0.1)
                }
            }.sheet(isPresented: $registerpageGo) {
                RegisterPage()
            }.sheet(isPresented: $loginpageGo) {
                LoginPage()
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}


