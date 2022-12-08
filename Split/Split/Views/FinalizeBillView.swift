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
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  @ObservedObject var activityViewModel = ActivityViewModel()
    
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
        
        Section{
          Text("Click on a person to add Items they got.")
            .fontWeight(.bold)
          ForEach(addFriendViewModel.addedFriends.sorted {($0.role, $0.user.full_name) < ($1.role, $1.user.full_name)}){
            friendRole in FinalizeBillFriendRowView(friendRole: friendRole, billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: billItems, addFriendViewModel: addFriendViewModel)
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
      NavigationLink(destination: NewBillCreatedView()) {
        Text("Complete Bill")
      }
      .padding()
      .foregroundColor(.white)
      .background(Color(red: 76/255, green: 229/255, blue: 177/255))
      .clipShape(Capsule())
      .simultaneousGesture(TapGesture().onEnded {
        var items_array : [String] = []
        for bill_item in billItems.bill_items {
          items_array.append(bill_item.name)
          items_array.append(bill_item.price)
          items_array.append(bill_item.email)
        }
        var bill_owers_array : [String] = []
        var bill_payers_array : [String] = []
        for friend_role in addFriendViewModel.addedFriends {
          if friend_role.role == "Ower" {
            bill_owers_array.append(friend_role.user.full_name)
          } else if friend_role.role == "Bill Payer" {
            bill_payers_array.append(friend_role.user.full_name)
          }
        }
        let bill : Bill = Bill(bill_owers: bill_owers_array, bill_payers: bill_payers_array, date: billDate, description: billDescription, title: billTitle, items: items_array)
        activityViewModel.add(bill)
      })
    }
  }
}
