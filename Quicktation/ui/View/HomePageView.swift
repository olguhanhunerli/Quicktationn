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
                    
                    
                    homeView(searchText: $searchText, viewModel: self.viewModel)
                        .onAppear{
                            viewModel.loadMains(userid: 1)
                        }
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
                    
                    MyProfileView(viewModel: self.viewModel)
                        .onAppear{
                            viewModel.loadMore(scanIndex: 1)
                        }
                        .tabItem {
                            Image("iconUser.png")
                        }
                }
                
            }
        }
    }
}


struct CircleView: View {
    var imageURL: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                
            
            AsyncImage(url: URL(string: imageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 44, height: 44)
        }
    }
}




struct textView: View {
    var quote: homePage2
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
                Text(quote.quote_text)
                                    .font(.custom("OpenSans-Regular", size: 12))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                                
                                Text("\(quote.likeCount) beğenme")
                                    .font(.custom("OpenSans-Regular", size: 12))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 100)
                                    .padding(.leading, 249)
                                
                                Text("-\(quote.username)")
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
            if let userPhoto = quote.userphoto{
                CircleView(imageURL: userPhoto)
                    .offset(x: geometry.size.width/2 - 170, y: geometry.size.height/2 - 85)
                    .frame(width: 44 , height: 44)
            }
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
    @ObservedObject var viewModel: HomePageViewModel
    //@Binding var userId1: HomePageViewModel
    var body: some View {
        
        ZStack {
            VStack{
                searchBar(searchText: $searchText)
                ScrollView{
                    LazyVStack{
                    VStack {
                
                        Spacer()
                        ForEach(viewModel.mainList.indices, id: \.self) { index in
                            textView(quote: viewModel.mainList[index])
                                .padding(.top , 30)
                                .onAppear {
                                    print("Item at index \(index) appeared")
                                    if index == (viewModel.mainList.count) - 1 && viewModel.scanIndex != -1 {
                                        viewModel.loadMore(scanIndex: -1)
                                    }
                                }
                        }
                        if viewModel.isLoading {
                          
                        }
                    }.onAppear{
                        viewModel.loadMore(scanIndex: 1)
                    }
                }
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
    @ObservedObject var viewModel: HomePageViewModel
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                VStack{
                    Button(action: {}) {
                        Image("3nokta")
                            .frame(width: 52 , height: 12)
                            .padding(.trailing, 240)
                    }
                    HStack(alignment: .center){
                        Text("muhtesemozgur9")
                        
                            .font(.custom("OpenSans-Regular", size: 20))
                            .frame(alignment: .center)
                            .padding(.top , 63)
                            .padding(.bottom , 34)
                            .padding(.leading , geometry.size.height * 0.15)
                        
                        
                        CircleView(imageURL: "")
                            .padding(.top , 39)
                            .padding(.leading, geometry.size.height * 0.026)
                            .frame(width:100 , height: 100)
                    }
                    HStack {
                        
                        VStack{
                            Text("Takipçi")
                                .font(.custom("OpenSans-Regular", size: 16))
                                .padding(.leading, geometry.size.height * 0.01)
                            
                            
                            Text("130")
                                .font(.custom("OpenSans-Regular", size: 16))
                                .padding(.leading, geometry.size.height * 0.01)
                        }
                        VStack{
                            Text("Takip edilen")
                                .font(.custom("OpenSans-Regular", size: 16))
                                .padding(.leading, 40)
                            Text("127")
                                .padding(.leading, 40)
                        }
                        VStack {
                            Text("Beğeni")
                                .font(.custom("OpenSans-Regular", size: 16))
                                .padding(.leading, 40)
                            Text("366")
                                .padding(.leading, 40)
                        }
                    }
                    
                    VStack{
                        ScrollView{
                            LazyVStack{
                                VStack {
                                    
                                    Spacer()
                                    ForEach(viewModel.mainList.indices, id: \.self) { index in
                                        textView(quote: viewModel.mainList[index])
                                           
                                            .onAppear {
                                                print("Item at index \(index) appeared")
                                                if index == (viewModel.mainList.count) - 1 && viewModel.scanIndex != -1 {
                                                    viewModel.loadMains(userid: 1)
                                                }
                                            }
                                    }
                                    if viewModel.isLoading {
                                        
                                    }
                                }.onAppear{
                                    viewModel.loadMains(userid: 14)
                                }
                            }
                        }
                    }
                    
                }.background(imageView())
            }
        }
    }
}
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
