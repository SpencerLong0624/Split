//
//  ActivityView.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white

    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}


extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}

struct ActivityView: View {
  // @EnvironmentObject var library: Library
  @ObservedObject var activityViewModel = ActivityViewModel()
  
  init() {

      UINavigationBar.appearance().backgroundColor = UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255)

       UINavigationBar.appearance().largeTitleTextAttributes = [
          .foregroundColor: UIColor.white]
  }
  
  var body: some View {
    NavigationView {
      VStack {
        List{
          let billViewModels = activityViewModel.billViewModels.sorted(by: { $0.bill < $1.bill })
          ForEach(billViewModels) { billViewModel in
            BillRowView(bill: billViewModel.bill)
            .accentColor(.blue)
          }
        }
        .navigationBarTitle("Activity")
      }
      .padding(.top, 1.0)
      .background(Color(red: 0.949, green: 0.949, blue: 0.97, opacity: 1.0))
    }
    .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255))
  }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
