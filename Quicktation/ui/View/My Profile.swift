//
//  My Profile.swift
//  Quicktation
//
//  Created by Olguhan Hünerli on 17.05.2023.
//

import SwiftUI

struct My_Profile: View {
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                
                TabView{
                    
                    
                    homeView()
                        .tabItem{
                            Image("iconHome.png")
                        }
                    NotificationView()
                        .tabItem {
                            Image("iconBell.png")
                        }
                    
                    NewPostView()
                        .tabItem {
                            Image("iconPlus.png")
                        }
                    
                    MessageView()
                        .tabItem {
                            Image("iconComments.png")
                        }
                    
                    MyProfileView()
                        .tabItem {
                            Image("iconUser.png")
                        }
                }
                
            }
        }
        
    }
}
struct homeView: View {
    var body: some View {
        Text("sa")
    }
}



struct My_Profile_Previews: PreviewProvider {
    static var previews: some View {
        My_Profile()
    }
}
