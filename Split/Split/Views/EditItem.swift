//
//  EditItem.swift
//  Split
//
//  Created by Spencer Long on 11/11/22.
//

import SwiftUI

struct EditItem: View {
  var billTitle: String
  var billDescription: String
  var billDate: String
  var curItem: BillItem
  var curItemIndex: Int
  
  @Binding var billItems: [BillItem]
  @State var billItemsObject : BillItems = BillItems()
  @ObservedObject var addFriendViewModel: AddFriendViewModel
    
  @State private var itemName: String = ""
  @State private var itemPrice: String = ""
  
  func changeItem() {
    billItems.remove(at: curItemIndex)
    billItems.insert(BillItem(name: itemName, price: itemPrice, assignedPerson: assignedPerson(personName: "", email: "")), at: curItemIndex)
  }
  
  var body: some View {
    VStack {
      HStack {
        Text(billTitle)
        .font(.title)
        .frame(maxWidth: .infinity, alignment: .leading)
        Text(billDate)
        .frame(maxWidth: .infinity, alignment: .trailing)
        Spacer()
        .frame(width: 10)
      }
      Text(billDescription)
      .frame(maxWidth: .infinity, alignment: .leading)
      Divider()
      .frame(width: 360, height: 1)
      .overlay(.black)
      Form {
        Section(header: Text("Item Information")){
          TextField("Current Item Name is: \(curItem.name)", text: $itemName)
          TextField("Current Value is: \(curItem.price)", text: $itemPrice)
        }
      }
      NavigationLink(destination: Manually_AddItem(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: billItemsObject, addFriendViewModel: addFriendViewModel).navigationBarBackButtonHidden(true)) {
        Text("Edit Item")
      }
      .padding()
      .foregroundColor(.white)
      .background(Color(red: 76/255, green: 229/255, blue: 177/255))
      .clipShape(Capsule())
      .simultaneousGesture(TapGesture().onEnded {
        changeItem()
        billItemsObject.bill_items = billItems
      })
      Spacer()
    }
  }
}
