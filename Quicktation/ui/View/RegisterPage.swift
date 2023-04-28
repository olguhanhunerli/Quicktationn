import SwiftUI

struct RegisterPage: View {
    @State private var nameSurname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    @ObservedObject var RPviewModel = RegisterViewModel()
    @Environment(\.presentationMode) var presentationmode

    var body: some View {
        
        GeometryReader { geometry in
            NavigationView {
                ZStack {
                    Image("main.png")
                        .resizable(resizingMode: .stretch)
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        LogoView()
                            
                            .padding(.top, geometry.size.height * 0.15)
                            .padding(.bottom, geometry.size.height * 0.1)

                        InputFieldView(title: "Ad Soyad", text: $nameSurname)
                            .padding(.bottom, geometry.size.height * 0.025)
                            

                        InputFieldView(title: "Email", text: $email)
                            .padding(.bottom, geometry.size.height * 0.025)

                        PasswordFieldView(title: "Şifre", password: $password)
                            .padding(.bottom, geometry.size.height * 0.025)

                        PasswordFieldView(title: "Şifre (Tekrar)", password: $password2)
                            .padding(.bottom, geometry.size.height * 0.05)
                        Button(action: {
                                    self.presentationmode.wrappedValue.dismiss()
                        }) {Text("Zaten hesabın var mı? Giriş yap")
                                .foregroundColor(.yellow)
                        }

                     

                        RegisterButton(RPviewModel: RPviewModel ,email: $email , password: $password , nameSurname: $nameSurname )
                            .padding(.top, geometry.size.height * 0.05)
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

    struct InputFieldView: View {
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
                        .font(.custom("OpenSans-Regular", size: 20))

                    Divider()
                        .background(Color.white)
                        .padding(.horizontal, 25)
                }
            }
        }
    }
    struct PasswordFieldView: View {
        var title: String
        @Binding var password: String

        var body: some View {
            ZStack(alignment: .leading) {
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
            }}
    }

    struct RegisterButton: View {
        @ObservedObject var RPviewModel : RegisterViewModel
        @Binding var email: String
        @Binding var password: String
        @Binding var nameSurname: String
        var body: some View {
            Button("Kayıt Ol") {
                self.RPviewModel.insert(email: self.email, password: self.password, namesurname: self.nameSurname, username: "")
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.1)
            .background(Color.white)
            .foregroundColor(.black)
            .font(.custom("Nunito-Bold", size: 36))
            .cornerRadius(15)
        }
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
