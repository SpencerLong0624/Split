//
//  AssignItemsRowView.swift
//  Split
//
//  Created by Spencer Long on 12/7/22.
//

import SwiftUI

struct AssignItemsRowView: View {
//  @ObservedObject var item: BillItem
  var billTitle: String
  var billDescription: String
  var billDate: String
  @State var item: BillItem
  var friendRole: friendRole
  @State var billItems : BillItems
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  @State var selected: Bool
    
  func chooseItem() {
    let curr_index : Int = billItems.bill_items.firstIndex(of: item)!
    if billItems.bill_items[curr_index].email == friendRole.user.email {
      billItems.bill_items[curr_index].email = ""
      billItems.bill_items[curr_index].user_full_name = ""
      
      if let friendIndex = addFriendViewModel.addedFriends.firstIndex(of: friendRole) {
        if let itemIndex = addFriendViewModel.addedFriends[friendIndex].assignedItems.firstIndex(of: item) {
          addFriendViewModel.addedFriends[friendIndex].assignedItems.remove(at: itemIndex)
        }
      }
      selected.toggle()
      return
    } else {
      billItems.bill_items[curr_index].email = friendRole.user.email
      billItems.bill_items[curr_index].user_full_name = friendRole.user.full_name
      if let friendIndex = addFriendViewModel.addedFriends.firstIndex(of: friendRole) {
        addFriendViewModel.addedFriends[friendIndex].assignedItems.append(item)
      }
      selected.toggle()
      return
    }
  }
  
  var body: some View {
    VStack {
      HStack {
        Text(item.name)
          .frame(maxWidth: .infinity, alignment: .leading)
        Text(item.price)
          .frame(maxWidth: .infinity, alignment: .center)
        
        if (item.email == friendRole.user.email || item.email == "") {
          if selected {
            Button(action: {
                chooseItem()
                }) {
                  Text("-")
                    .fontWeight(.bold)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .clipShape(Circle())
            }
                .frame(maxWidth: .infinity, alignment: .trailing)
          } else {
            Button(action: {
                chooseItem()
                }) {
                  Text("+")
                    .fontWeight(.bold)
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.white)
                    .background(Color(red: 76/255, green: 229/255, blue: 177/255))
                    .clipShape(Circle())
            }
                .frame(maxWidth: .infinity, alignment: .trailing)
          }

        } else {
          Text("\(item.name) has been assigned to \(item.user_full_name)")
            .font(.caption2)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
      }
    }
  }
}
