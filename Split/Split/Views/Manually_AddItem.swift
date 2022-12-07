//
//  Manually_AddItem.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/9/22.
//

import SwiftUI

struct Manually_AddItem: View {
  var billTitle: String
  var billDescription: String
  var billDate: String
  @ObservedObject var billItems : BillItems
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  @State var editIsActive = false
  @State var changedItem: BillItem = BillItem(name: "", price: "")
  @State var changedItemIndex = 0
  
  func deleteItem(at offsets: IndexSet) {
    billItems.bill_items.remove(atOffsets: offsets)
  }
  
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
          ForEach(addFriendViewModel.addedFriends.sorted {($0.role, $0.name) < ($1.role, $1.name)}){
            friendRole in FriendRowView(friendRole: friendRole)
          }
        }

        if billItems.bill_items.isEmpty == true {
          Section(header: Text("Items")) {
            NavigationLink(destination: AddOneItemView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: $billItems.bill_items, addFriendViewModel: addFriendViewModel)) {
              Text("Add Item")
            }
          }
        } else {
          Section(header: Text("Items")) {
            NavigationLink(destination: AddOneItemView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: $billItems.bill_items, addFriendViewModel: addFriendViewModel)) {
              Text("Add Item")
            }
            NavigationLink(destination: FinalizeBillView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: billItems, addFriendViewModel: addFriendViewModel)) {
              Text("Finalize Items")
            }
            .foregroundColor(.green)
            //            .simultaneousGesture(TapGesture().onEnded { var items_array : [String] = []
            //              for bill_item in billItems.bill_items {
            //                items_array.append(bill_item.name)
            //                items_array.append(bill_item.price)
            //              }
            //              let bill : Bill = Bill(bill_owers: [], bill_payers: [], date: billDate, description: billDescription, title: billTitle, items: items_array)
            //              activityViewModel.add(bill) })
            //          }
          }
          
          Section {
            List {
              HStack {
                Text("Item Name")
                  .fontWeight(.bold)
                  .frame(maxWidth: .infinity, alignment: .leading)
                Text("Price ($)")
                  .fontWeight(.bold)
                  .frame(maxWidth: .infinity, alignment: .trailing)
              }
              ForEach(billItems.bill_items) { Item in
                BillItemRowView(item: Item)
                  .swipeActions(allowsFullSwipe: false) {
                    Button(role: .destructive) {
                      if let index = billItems.bill_items.firstIndex(of: Item) {
                        billItems.bill_items.remove(at: index)
                      }
                    } label: {
                      Label("Delete", systemImage: "trash.fill")
                    }
                    
                    Button {
                      changedItem = Item
                      if let index = billItems.bill_items.firstIndex(of: Item) {
                        changedItemIndex = index
                      }
                      editIsActive.toggle()
                    } label: {
                      Label("Edit", systemImage: "dots")
                        .labelStyle(TitleOnlyLabelStyle())
                    }
                    .tint(.blue)
                  }
              }
              NavigationLink(destination: EditItem(billTitle: billTitle, billDescription: billDescription, billDate: billDate, curItem: changedItem, curItemIndex: changedItemIndex, billItems: $billItems.bill_items, addFriendViewModel: addFriendViewModel), isActive: $editIsActive) {
                Label("Edit", systemImage: "dots")
                  .labelStyle(TitleOnlyLabelStyle())
              }
              .hidden()
            }
          }
        }
      }
    }
  }
}
