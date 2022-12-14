//
//  ActivityView.swift
//  Split
//
//  Created by Anthony A Lees on 11/4/22.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {

  var backgroundColor: UIColor?
  var textColor: UIColor?
    
  init( backgroundColor: UIColor?, textColor: UIColor?) {
    self.backgroundColor = backgroundColor
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = .clear
    coloredAppearance.titleTextAttributes = [.foregroundColor: textColor!]
    coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor!]
        
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
 func navigationBarColor(_ backgroundColor: UIColor?, _ textColor: UIColor) -> some View {
   self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, textColor: textColor))
  }
}

var dummyAuthModel: DummyAuthViewModel = DummyAuthViewModel()

struct ActivityView: View {
  @ObservedObject var activityViewModel = ActivityViewModel(email: dummyAuthModel.user?.email ?? "anthony@gmail.com")
  @State var searchField: String = ""
  @State var filterField : String = "Filter by Date Ascending"
  @EnvironmentObject private var authModel: AuthViewModel
  
  init() {
    UINavigationBar.appearance().backgroundColor = UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255)
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
  }

  var body: some View {
    let binding = Binding<String>(get: {
      self.searchField
    }, set: {
      self.searchField = $0
      self.activityViewModel.search(searchText: self.searchField)
    })
    
  NavigationStack {
    VStack {
      HStack {
        TextField("Search for a Bill", text: binding)
          .tint(.black)
        Button(
            action: {
              if filterField == "Filter by Date Ascending" {
                self.filterField = "Filter by Date Descending"
              } else {
                self.filterField = "Filter by Date Ascending"
              }
            },
            label: {
                Text("Sort")
                .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
                Image(systemName: "arrow.up.arrow.down")
                .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
            }
        )
      }

      List {
        ForEach(displayBills()) { billViewModel in
          BillRowView(bill: billViewModel.bill)
        }
      }
    }
    .padding(.top, 1.0)
    .background(Color(red: 0.949, green: 0.949, blue: 0.97, opacity: 1.0))
    .navigationBarTitle("Activity")
    .toolbar {
      ToolbarItemGroup() {
        NavigationLink(destination: FriendsView()) {
          Text("Add Friends")
        }
      }
    }
  }
  .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255), UIColor.white)
}
  
  func displayBills() -> [BillViewModel] {
    var displayedBills : [BillViewModel] = []
    if searchField == "" {
      if filterField == "Filter by Date Ascending" {
        displayedBills = self.activityViewModel.billViewModels.sorted {return $0.bill.date > $1.bill.date }
      } else {
        displayedBills = self.activityViewModel.billViewModels.sorted {return $0.bill.date < $1.bill.date }
      }
    } else {
      if filterField == "Filter by Date Ascending" {
        displayedBills = self.activityViewModel.filteredBillViewModels.sorted {return $0.bill.date > $1.bill.date }
      } else {
        displayedBills = self.activityViewModel.filteredBillViewModels.sorted {return $0.bill.date < $1.bill.date }
      }
    }

    return displayedBills
  }
}
