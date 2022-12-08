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
      List {
        ForEach(billItems.bill_items) { Item in
          AssignItemsRowView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, item: Item, friendRole: friendRole, billItems: billItems, addFriendViewModel: addFriendViewModel).navigationBarBackButtonHidden(true)
        }
      }
      NavigationLink(destination: FinalizeBillView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: billItems, addFriendViewModel: addFriendViewModel)) {
        Text("Return to Bill")
      }
      .padding()
      .foregroundColor(.white)
      .background(Color(red: 76/255, green: 229/255, blue: 177/255))
      .clipShape(Capsule())
      Spacer()
    }
  }
}
