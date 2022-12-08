//
//  FinalizeBillView.swift
//  Split
//
//  Created by Spencer Long on 12/7/22.
//

import SwiftUI

struct FinalizeBillView: View {
  var billTitle: String
  var billDescription: String
  var billDate: String
  @ObservedObject var billItems : BillItems
  @ObservedObject var activityViewModel = ActivityViewModel()
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  var body: some View {
    VStack {
      Form {
        Section(header: Text("Bill Information")) {
          HStack {
            Text("\(billTitle)")
              .fontWeight(.medium)
              .frame(maxWidth: .infinity, alignment: .leading)
            Text("\(billDate)")
              .frame(maxWidth: .infinity, alignment: .trailing)
          }
          Text("\(billDescription)")
            .italic()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        Section(header: Text("Friends")) {
          ForEach(addFriendViewModel.addedFriends.sorted {($0.role, $0.user.full_name) < ($1.role, $1.user.full_name)}){
            friendRole in FriendRowView(friendRole: friendRole)
          }
        }
        
        Section(header: Text("Items")) {
          List {
            HStack {
              Text("Item Name")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
              Text("Price ($)")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .center)
              Text("Person")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ForEach(billItems.bill_items) { Item in
              FinalizeBillItemRowView(item: Item)
            }
          }
        }
      }
    }
  }
}
