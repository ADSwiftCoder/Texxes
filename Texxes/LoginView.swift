import SwiftUI
import Firebase
struct ContentView: View {
    @State private var  email = ""
    @State private var username = ""
    @State private var  password = ""
    @State private var  userIsLoggedIn = false
    
    var  body: some View {
        if userIsLoggedIn  {
          
        } else {
            content
        }
    }
        
    var content: some View {
        ZStack{
            Color.white
            
            RoundedRectangle(cornerRadius: 30, style : .continuous)
            
                .foregroundStyle(.linearGradient (colors: [ .blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
            
                .frame (width:1000, height: 400)
            
                .rotationEffect(.degrees(135))
            
                .offset(y:-350)
            
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.black)
                    .font(.system( size: 40, weight: .bold , design: .rounded))
                    .offset(x:-100, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder( when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.black)
                            .bold()
                    }
                Rectangle()
                    .frame(width: 350, height: 1 )
                    .foregroundColor(.black)
                
                SecureField("Password",  text: $password)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                    .placeholder( when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.black)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1 )
                    .foregroundColor(.black)
                
                Button {
                    register()
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(width:200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10,  style:  .continuous)
                                .fill(.linearGradient(colors: [ .blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 110)
                
                Button {
                    login()
                } label: {
                    Text("Already have an account? Login")
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.top)
                .offset(y: 110)
                
                
            }
            .frame(width: 350)
            .onAppear{
                Auth.auth().addStateDidChangeListener  { auth,  user  in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
            . ignoresSafeArea()

    }
        func login() {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error !=  nil {
                    print(error!.localizedDescription)
                }
            }
        }
        
        func register () {
            Auth.auth().createUser(withEmail: email, password: password) {result , error in
                if error != nil {
                    print(error!.localizedDescription)
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    extension View {
        func placeholder<Content: View>(
            when shouldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {
                ZStack(alignment: alignment) {
                    placeholder().opacity(shouldShow ? 1 : 0)
                    self
                    
                }
                
            }
    }

