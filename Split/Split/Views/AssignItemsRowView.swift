//
//  AssignItemsRowView.swift
//  Split
//
//  Created by Spencer Long on 12/7/22.
//

import SwiftUI

struct AssignItemsRowView: View {
//  @ObservedObject var item: BillItem
  var item: BillItem
  var friendRole: friendRole
  @ObservedObject var billItems : BillItems
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  @State var selected: Bool = false
  
  func chooseItem() {
    selected.toggle()
    if item.assignedPerson.email == friendRole.user.email {
      print("removing item from person")
    } else {
      print("adding item to person")
    }
  }
  
  var body: some View {
    HStack {
      Text(item.name)
        .frame(maxWidth: .infinity, alignment: .leading)
      Text(item.price)
        .frame(maxWidth: .infinity, alignment: .center)
      if selected == true {
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
      } else {
        Button(action: {
            chooseItem()
            }) {
              Text("+")
                .fontWeight(.bold)
                .frame(width: 25, height: 25)
                .foregroundColor(Color.white)
                .background(Color.gray)
                .clipShape(Circle())
        }
      }
    }
  }
}
