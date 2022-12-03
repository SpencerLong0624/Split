//
//  AccountView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/29/22.
//

import SwiftUI

struct AccountView: View {
   @EnvironmentObject private var authModel: AuthViewModel
    var body: some View {
        
       VStack {
       Text("\(authModel.user?.email ?? "")")
       }.toolbar {
       ToolbarItemGroup(placement: .navigationBarLeading) { Button(
       action: { authModel.signOut()
       }, label: {
       Text("Sign Out") .bold().accentColor(.red)
       })
       }
       }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
