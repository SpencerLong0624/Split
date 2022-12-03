import SwiftUI


struct AppView: View {
   
   @EnvironmentObject private var authModel: AuthViewModel
   
    var body: some View {
       Group {
       if authModel.user != nil {
       HomeScreenView()
       } else {
       LoginView()
       }
       }.onAppear {
       authModel.listenToAuthState()
       }
    }
   
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
      AppView()
    }
  }
