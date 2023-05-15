import SwiftUI
import AVFoundation
struct HomePageView: View {
    @State private var searchText: String = ""
    @ObservedObject var viewModel = HomePageViewModel()
    var body: some View {
        GeometryReader { geometry in
            ZStack{
               /* searchBar(searchText: $searchText)*/
                Spacer()
                TabView{
                    
                        
                    homeView(searchText: $searchText)
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


struct CircleView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 44, height: 44)
            
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
        }
    }
}


struct textView: View {
    var body: some View{
        GeometryReader { geometry in
            ZStack{
                
                RoundedRectangle(cornerRadius: 50)
                
                    .overlay(
                        Image("textPng")
                            .resizable()
                            .frame(width: geometry.size.width , height:  geometry.size.height)
                            .aspectRatio(contentMode: .fill)
                    )
                    .border(Color.black.opacity(0))
                
                
                Text("#Hayat bizi resmen dört işlemle sınar; Gerçeklerle çarpar, ayrılıklarla böler,    #insanlık tan çıkarır vesonunda topla kendini der.#Hayat bizi resmen dört işlemle   sınar; Gerçeklerle çarpar, ayrılıklarla böler, #insanlık tan çıkarır ve sonunda topla kendini der")
                    .font(.custom("OpenSans-Regular", size: 12))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                Text("550 beğenme")
                    .font(.custom("OpenSans-Regular", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.bottom, 100)
                    .padding(.leading, 249)
                
                Text("-muhtesemozgur9")
                    .font(.custom("OpenSans-Regular", size: 12))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.top, 100)
                    .padding(.horizontal, -160)
                Button (action: {}) {
                    Image("paylas")
                }
                .padding(.top, 90)
                .padding(.leading, 210)
                Button (action: {}) {
                    Image("voice")
                }
                .padding(.top, 90)
                .padding(.leading, 160)
                Button (action: {}) {
                    Image("like")
                }
                .padding(.top, 90)
                .padding(.leading, 270)
            }
                
                CircleView()
                    .offset(x: geometry.size.width/2 - 170, y: geometry.size.height/2 - 85) // Offset değerini kullanarak CircleView'ı konumlandırın
                
            }.frame(width: 329, height: 126)
                .padding(20)
        }
    }

struct searchBar: View {
    @Binding var searchText: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                
                        .fill(Color.gray.opacity(0.01))
                        .border(Color.gray.opacity(0))
                        .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 2)
                        )
                        /*.cornerRadius(20)*/
                    HStack {
                        Image("araButton")
                        TextField("Ara..", text: $searchText)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 10)
                }
                .frame(width: 281, height: 41)
                .padding(.horizontal, 15)
            }
    }
struct homeView : View{
    @Binding var searchText: String
    var body: some View {
        ZStack {
            ScrollView{
                VStack {
                    searchBar(searchText: $searchText)
                        .padding(.top, 25) // search bar'ın üst tarafına padding ekler.
                        
                    Spacer()
                   textView()
                        
                        .padding(.top , 30)
                }
            }.background(imageView())
        }
    }
}
struct imageView: View{
    var body: some View{
        Image("homepage.png")
                       .resizable()
                       .scaledToFill()
                       .edgesIgnoringSafeArea(.all)
                       .frame(maxWidth: .infinity, maxHeight: .infinity)
                       .tabViewStyle(DefaultTabViewStyle())    }
}
struct NotificationView: View {
    var body: some View {
        ZStack{
            imageView()
            
            Text("Notification")
        }
    }
}

struct MessageView: View {
    var body: some View {
        ZStack{
            imageView()
            
            Text("Message")
        }
    }
}

struct NewPostView: View {
    var body: some View {
        ZStack{
            imageView()
            
            Text("NewPost")
        }
    }
}

struct MyProfileView: View {
    var body: some View {
        ZStack{
            imageView()
            
            Text("My Profile")
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
