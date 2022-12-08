//
//  AssignItemsView.swift
//  Split
//
//  Created by Spencer Long on 12/7/22.
//

import SwiftUI

struct AssignItemsView: View {
  var billTitle: String
  var billDescription: String
  var billDate: String
  var friendRole: friendRole
  @ObservedObject var billItems : BillItems
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  var body: some View {
    VStack {
      Form {
        Section(header: Text("Items")) {
          HStack {
            Text("Item")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            Text("Price ($)")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .center)
            Text("Paid?")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .trailing)
          }
          ForEach(billItems.bill_items) { Item in
            AssignItemsRowView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, item: Item, friendRole: friendRole, billItems: billItems, addFriendViewModel: addFriendViewModel, selected: friendRole.user.email == Item.email)
          }
        }
        
        Section {
        } footer: {
          NavigationLink(destination: FinalizeBillView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: billItems, addFriendViewModel: addFriendViewModel)
            .navigationBarBackButtonHidden(true)
          ) {
            Text("Return to Bill")
          }
          .padding()
          .foregroundColor(.white)
          .background(Color(red: 76/255, green: 229/255, blue: 177/255))
          .clipShape(Capsule())
        }
      }
    }
  }
}
