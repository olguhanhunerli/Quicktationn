import SwiftUI

struct HomePageView: View {
    @ObservedObject var viewModel = HomePageViewModel()
    var body: some View {
        GeometryReader { geometry in
            
            ZStack(alignment: .topLeading) {
                    TabView{
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
                    Image("homepage.png")
                                   .resizable()
                                   .scaledToFill()
                                   .edgesIgnoringSafeArea(.all)
                                   .frame(maxWidth: .infinity, maxHeight: .infinity)
                                   .tabViewStyle(DefaultTabViewStyle())
                    .frame(width: geometry.size.width, height: geometry.size.height - 50)
                }
            }
        }
    }

struct NotificationView: View {
    var body: some View {
        
        Text("Notification")
    }
}

struct MessageView: View {
    var body: some View {
        
        Text("Message")
    }
}

struct NewPostView: View {
    var body: some View {
       
        Text("New Post")
    }
}

struct MyProfileView: View {
    var body: some View {
        
        Text("ProfilSayfası")
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
