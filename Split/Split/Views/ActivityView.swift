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
  @ObservedObject var activityViewModel = ActivityViewModel()
  @State var searchField: String = ""
  @State var filterField : String = "Filter by Date Ascending"
  @State var displayedBills : [BillViewModel] = []
  @EnvironmentObject private var authModel: AuthViewModel
  
  init() {
    UINavigationBar.appearance().backgroundColor = UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255)
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
  }

  var body: some View {
    let binding = Binding<String>(get: {
      self.searchField
    }, set: {
      self.searchField = $0
      self.activityViewModel.search(searchText: self.searchField)
      self.displayBills()
    })
    
  NavigationStack {
    VStack {
      HStack {
        TextField("Search for a Bill", text: binding)
          .tint(.black)
        Button(
            action: {
              if filterField == "Filter by Date Ascending" {
                self.displayedBills = self.displayedBills.sorted {return $0.bill.date < $1.bill.date }
                self.filterField = "Filter by Date Descending"
              } else {
                self.displayedBills = self.displayedBills.sorted {return $0.bill.date > $1.bill.date }
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
        ForEach(displayedBills) { billViewModel in
          BillRowView(bill: billViewModel.bill)
        }
      }
    }
    .padding(.top, 1.0)
    .background(Color(red: 0.949, green: 0.949, blue: 0.97, opacity: 1.0))
    .onAppear(perform: loadData)
    .navigationBarTitle("Activity")
    .toolbar {
      ToolbarItemGroup() {
        NavigationLink(destination: FriendsView()) {
          Text("Add Friends")
        }
      }
    }
  }
  .navigationBarColor(UIColor(red: 76/255, green: 229/255, blue: 177/255, alpha: 255/255))
}
  
  func loadData() {
    self.activityViewModel.filterUserAssociatedBills(email: authModel.user?.email ?? "testtest@gmail.com")
    if filterField == "Filter by Date Ascending" {
      self.displayedBills = self.activityViewModel.billViewModels.sorted {return $0.bill.date > $1.bill.date }
    } else {
      self.displayedBills = self.activityViewModel.billViewModels.sorted {return $0.bill.date < $1.bill.date }
    }
  }
  
  func displayBills() {
    self.activityViewModel.filterUserAssociatedBills(email: authModel.user?.email ?? "testtest@gmail.com")
    if searchField == "" {
      if filterField == "Filter by Date Ascending" {
        self.displayedBills = self.activityViewModel.billViewModels.sorted {return $0.bill.date > $1.bill.date }
      } else {
        self.displayedBills = self.activityViewModel.billViewModels.sorted {return $0.bill.date < $1.bill.date }
      }
    } else {
      if filterField == "Filter by Date Ascending" {
        self.displayedBills = self.activityViewModel.filteredBillViewModels.sorted {return $0.bill.date > $1.bill.date }
      } else {
        self.displayedBills = self.activityViewModel.filteredBillViewModels.sorted {return $0.bill.date < $1.bill.date }
      }
    }
  }
}
