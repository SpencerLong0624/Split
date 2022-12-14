//
//  BillDetailsView.swift
//  Split
//
//  Created by Anthony A Lees on 11/5/22.
//

import SwiftUI

extension [String]: Identifiable {
    public var id: [String] {
        self
    }
}

struct BillDetailsView: View {
  var bill: Bill
  @ObservedObject var usersViewModel = UsersViewModel()
  
  var body: some View {
    VStack {
      Form {
        Section(header: Text("Bill Information")) {
          HStack {
            Text(bill.title)
              .fontWeight(.medium)
              .frame(maxWidth: .infinity, alignment: .leading)
            Text(bill.date)
              .frame(maxWidth: .infinity, alignment: .trailing)
          }
          Text(bill.description)
            .italic()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        Section(header: Text("Bill Payers")) {
          ForEach(bill.bill_payers.sorted()) { billPayer in
            BillDetailFriendRowView(person: billPayer, usersViewModel: usersViewModel)
          }
        }
        
        Section(header: Text("Bill Owers")) {
          ForEach(bill.bill_owers.sorted()) { billOwer in
            BillDetailFriendRowView(person: billOwer, usersViewModel: usersViewModel)
          }
        }
        
        Section(header: Text("Money Owed")) {
          List {
            HStack {
              Text("Person")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
              Text("Total Amount")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            ForEach(generateUserTotals(bill)) { user_group in
              BillDetailsUserRowView(user_group: user_group)
            }
          }
        }

        Section(header: Text("Items")) {
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
          ForEach(generateItemGroups(bill)) { item_group in
            BillDetailsItemRowView(item_group: item_group)
          }
        }
      }
    }
    .navigationBarTitle("Bill Details")
  }
  
  func generateItemGroups(_ bill: Bill) -> [[String]] {
    var item_array : [[String]] = []
    for i in stride(from: 2, to: bill.items.count, by: 3) {
      var curr_item_group : [String] = []
      curr_item_group.append(bill.items[i - 2])
      curr_item_group.append(bill.items[i - 1])
      curr_item_group.append(bill.items[i])
      item_array.append(curr_item_group)
    }
    
    return item_array
  }
  
  func generateUserTotals(_ bill: Bill) -> [[String]] {
    var user_array : [[String]] = []
    for email in bill.bill_owers {
      let name : String = usersViewModel.getUser(email: email)[0].user.full_name
      var curr_user_group : [String] = [name]
      var curr_sum : Float = 0.00
      for i in stride(from: 2, to: bill.items.count, by: 3) {
        if (bill.items[i] == name) {
          curr_sum += Float(bill.items[i - 1])!
        }
      }
      curr_user_group.append(String(curr_sum))
      user_array.append(curr_user_group)
    }
    
    return user_array
  }
}
