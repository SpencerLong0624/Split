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
        
        // Anthony, add your code here. This 'CreateAnotherBillVIew is the view asking the user if they want to create a new bill
        // or not. I think you said you wanted to do this.
        Section {
          NavigationLink(destination: NewBillCreatedView()) {
            Text("Complete Bill")
          }
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
    }
  }
}



// Anthony Previous Code for adding to DB
//            .simultaneousGesture(TapGesture().onEnded { var items_array : [String] = []
//              for bill_item in billItems.bill_items {
//                items_array.append(bill_item.name)
//                items_array.append(bill_item.price)
//              }
//              let bill : Bill = Bill(bill_owers: [], bill_payers: [], date: billDate, description: billDescription, title: billTitle, items: items_array)
//              activityViewModel.add(bill) })
//          }
