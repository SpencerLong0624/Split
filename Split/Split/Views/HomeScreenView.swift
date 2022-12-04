import SwiftUI


struct HomeScreenView: View {
   var body: some View {
      
     
     
    TabView {
    
      ActivityView()
      .tabItem {
        Label("Activity", systemImage: "arrow.left.arrow.right")
      }

      NewBillView()
      .tabItem {
        Label("New Bill", systemImage: "rectangle.stack.badge.plus")
      }
       
       AccountView()
       .tabItem {
         Label("My Accont", systemImage: "gear")
       }
    }
    .onAppear() {
      UITabBar.appearance().backgroundColor = UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255)
    }
    .accentColor(.white)
  }
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
      HomeScreenView()
    }
  }
