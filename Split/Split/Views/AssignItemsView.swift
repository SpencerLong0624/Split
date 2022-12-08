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
    List {
      ForEach(billItems.bill_items) { Item in
        AssignItemsRowView(item: Item, friendRole: friendRole, billItems: billItems, addFriendViewModel: addFriendViewModel)
      }
    }
  }
}
