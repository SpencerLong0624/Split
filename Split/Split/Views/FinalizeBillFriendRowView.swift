//
//  FinalizeBillFriendRowView.swift
//  Split
//
//  Created by Spencer Long on 12/7/22.
//

import SwiftUI

struct FinalizeBillFriendRowView: View {
  @State var friendRole: friendRole
  
  var billTitle: String
  var billDescription: String
  var billDate: String
  @ObservedObject var billItems : BillItems
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  var body: some View {
    NavigationLink(
      destination: AssignItemsView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, friendRole: friendRole, billItems: billItems, addFriendViewModel: addFriendViewModel),
      label: {
        VStack(alignment: .leading) {
          Text("\(friendRole.user.full_name)")
          if friendRole.role == "Bill Payer" {
            Text("\(friendRole.role)")
            .font(.caption)
            .foregroundColor(.green)
          } else {
            Text("\(friendRole.role)")
            .font(.caption)
            .foregroundColor(.red)
          }
        }
      }
    )
  }
}
