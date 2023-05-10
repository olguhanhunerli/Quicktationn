import SwiftUI

struct RegisterPage: View {
    @State private var namesurname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var password2: String = ""
    @State private var go: Bool = false
    @State private var username: String = ""
    @State private var showNameSurnameRequiredError : Bool = false
    @State private var showPasswordMismatchError: Bool = false
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

                        InputFieldView(title: "Ad Soyad", text: $namesurname)
                            .padding(.bottom, geometry.size.height * 0.025)

                        InputFieldView(title: "Kullanıcı Adı", text: $username)
                            .padding(.bottom, geometry.size.height * 0.025)

                        InputFieldView(title: "Email", text: $email)
                            .padding(.bottom, geometry.size.height * 0.025)

                        PasswordFieldView(title: "Şifre", password: $password)
                            .padding(.bottom, geometry.size.height * 0.025)
                            .onChange(of: password) { _ in
                                checkPasswords()
                            }

                        PasswordFieldView(title: "Şifre (Tekrar)", password: $password2)
                            .padding(.bottom, geometry.size.height * 0.05)
                            .onChange(of: password2) { _ in
                                checkPasswords()
                            }

                        Group {
                            if showPasswordMismatchError {
                                Text("Şifreler eşleşmiyor")
                                    .foregroundColor(.red)
                            }
                        }

                        Button(action: {
                            self.presentationmode.wrappedValue.dismiss()
                        }) {
                            Text("Zaten hesabın var mı? Giriş yap")
                                .foregroundColor(.yellow)
                        }

                        RegisterButton(RPviewModel: RPviewModel, email: $email, password: $password, namesurname: $namesurname, password2: $password2, username: $username) { isSuccess in
                            if isSuccess {
                                print("Başarılı")
                                self.go = true
                            } else {
                                print("hatalı")
                            }
                        }
                        .padding(.top, geometry.size.height * 0.05)
                        .disabled(namesurname.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty || password2.isEmpty)
                        .opacity((namesurname.isEmpty || username.isEmpty || email.isEmpty || password.isEmpty || password2.isEmpty) ? 0.5 : 1.0)
                        }
                    }
                }
            }
        }
    

    func checkPasswords() {
        showPasswordMismatchError = password != password2
        
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
                var onCommit: (()-> Void)? = nil
                var body: some View {
                    ZStack(alignment: .leading) {
                        if text.isEmpty {
                            Text(title)
                                .foregroundColor(.white)
                                .font(.custom("OpenSans-Regular", size: 20))
                                .padding(.horizontal, 25)
                        }
                        VStack(spacing: 0) {
                            TextField("", text: $text, onCommit: {onCommit?()})
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
                var onCommit: (()-> Void)? = nil
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
                @Binding var namesurname: String
                @Binding var password2: String
                @Binding var username: String
                @State private var showNameSurnameRequiredError: Bool = false
                
                var completion: ((Bool)->Void)? = nil
                var body: some View {
                    Button("Kayıt Ol") {
                        
                        RPviewModel.userRegistration.namesurname = namesurname
                        RPviewModel.userRegistration.email = email
                        RPviewModel.userRegistration.password = password
                        RPviewModel.userRegistration.username = username
                        RPviewModel.registerUser{successMessage, errorMessage in
                            if let successMessage = successMessage {
                                print("Başarılı: \(successMessage)")
                                completion?(true)
                            } else if let errorMessage = errorMessage {
                                print("Hatalı: \(errorMessage)")
                                completion?(false)
                            }
                        }
                        
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


