//
//  ContentView.swift
//  AppEnvironmen
//
//  Created by Claudio Tendean on 16/05/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userAuth: AuthUser
    
    var body: some View {
        if !userAuth.isLogin {
            return AnyView(PageLogin().environmentObject(userAuth))
        } else {
            return AnyView(Home().environmentObject(userAuth))
        }
    }
}

struct Home : View {
    @EnvironmentObject var userAuth : AuthUser
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.green
                Text("Home").foregroundColor(.white)
                
                    .navigationBarTitle("Home", displayMode: .inline)
                    .navigationBarItems(leading:
                                            Button(action: {self.userAuth.isLogin = false}) {
                        Image(systemName: "arrowshape.turn.up.right.circle")
                    }
                    )
            }
        }
    }
}

struct PageLogin : View {
    
    @EnvironmentObject var userAuth : AuthUser
    
    @State var userName : String = ""
    @State var password : String = ""
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244/255.0, opacity: 1.0)
    
    func cekLogin() {
        if(userName == "claudio" && password == "123123") {
            userAuth.isLogin = true
        } else {
            userAuth.isLogin = false
            userAuth.isCorrect = false
        }
    }
    
    var body: some View {
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            
            VStack{
                HStack{
                    HStack{
                        VStack{
                            
                            Text("Hi")
                                .bold()
                                .font(.largeTitle)
                                .foregroundColor(Color.white)
                            
                            Text("Welcome Back")
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                        
                        Image("LogoApp")
                            .resizable()
                            .frame(width: 125, height: 152)
                            .padding()
                    }
                    Spacer()
                }
                .frame(height: 180)
                .padding(30)
                .background(Color("ADDDD0"))
                .clipShape(CustomShapes(corner: .bottomRight, radii: 50))
                .edgesIgnoringSafeArea(.top)
                
                // Form Filed
                VStack(alignment: .leading){
                    Text("Email address")
                    TextField("Type your email....", text: $userName)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(10)
                    
                    Text("Password")
                    SecureField("Type your password....", text: $password)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(10)
                    
                    // Show the Error
                    if(!userAuth.isCorrect) {
                        Text("Sorry your email and password inCorrect")
                            .foregroundColor(Color.red)
                    }
                    
                    HStack{
                        Button(action: {print("OK")}){
                            Text("Forgot Password?")
                        }
                        Spacer()
                    }.padding([.top, .bottom], 10)
                    
                    // SignIn Button
                    HStack{
                        Spacer()
                        Button(action: {self.cekLogin()}) {
                            Text("SignIn").bold().font(.callout).foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color("ADDDD0"))
                    .cornerRadius(15)
                    
                    // Privacy
                    
                    HStack{
                        Spacer()
                        Button(action: {print("OK")}) {
                            Text("Our Privacy Police")
                                .bold()
                                .font(.callout)
                                .foregroundColor(Color("ADDDD0"))
                        }
                        Spacer()
                    }.padding()
                    
                    
                    HStack{
                        Text("Dont have an account?")
                            .bold()
                            .font(.callout)
                            .foregroundColor(.black)
                        Spacer()
                        Button(action: {print("OK")}) {
                            Text("SignUp")
                                .bold()
                                .font(.callout)
                                .foregroundColor(Color("ADDDD0"))
                        }
                    }.padding()
                }.padding(25)
                
                Spacer()
            }
        }
    }
}


// Custom Shapes

struct CustomShapes : Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthUser())
    }
}
