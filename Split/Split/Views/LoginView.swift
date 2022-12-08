//
//  SignupView.swift
//  authtest
//
//  Created by Muhammad Uzair Umar on 11/29/22.
//

import SwiftUI

struct LoginView: View {
  @EnvironmentObject private var authModel: AuthViewModel
  @State private var isLogin = false
  @State private var emailAddress: String = ""
  @State private var password: String = ""
  var body: some View {
    NavigationStack {
      VStack(spacing: 16) {
        Picker("", selection: $isLogin) {
          Text("Log In")
          .tag(true)
          Text("Create Account")
          .tag(false)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        TextField("Email", text: $emailAddress)
        .tint(.black)
        .keyboardType(.emailAddress)
        .disableAutocorrection(true)
        .autocapitalization(.none)
        .textFieldStyle(.roundedBorder)
        .frame(width: 280, height: 45, alignment: .center)
        SecureField("Password", text: $password)
        .textFieldStyle(.roundedBorder)
        .frame(width: 280, height: 45, alignment: .center)
        Spacer()
        Button(action: {
          // TODO
          if isLogin {
            authModel.loginUser(emailAddress: emailAddress, password: password)
          } else {
            authModel.signUp(emailAddress: emailAddress, password: password)
             authModel.addUserToFirebase(emailAddress: emailAddress)
          }
        }, label: {
          Text(isLogin ? "Log In" : "Create Account")
          .foregroundColor(.white)
          }).frame(width: 280, height: 45, alignment: .center)
          .background(Color.blue)
          .cornerRadius(8)
        }.navigationTitle(isLogin ? "Welcome Back" : "Welcome")
      }
   }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
