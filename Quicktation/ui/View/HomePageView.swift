import SwiftUI

struct HomePageView: View {
    @ObservedObject var viewModel = HomePageViewModel()
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                TabView {
                    HomePageView2(viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "1.circle.fill")
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
                /*.frame(width: geometry.size.width, height: geometry.size.height - 50)*/
            }
        }
    }
}
struct HomePageView2: View{
    @ObservedObject var viewModel: HomePageViewModel
    var body: some View {
        VStack {
            List(viewModel.users.indices, id: \.self) { index in
                Group {
                    if viewModel.users[index].scanIndex != -1 {
                        VStack {
                            Text("User ID: \(viewModel.users[index].userId)")
                            Text("Scan Index: \(viewModel.users[index].scanIndex)")
                        }
                    } else {
                        EmptyView()
                    }
                }
                .onAppear {
                    if index == viewModel.users.count - 1 {
                        viewModel.fetchUser()
                    }
                }
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
