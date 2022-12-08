//
//  AddOneItemView.swift
//  Split
//
//  Created by Spencer Long on 11/10/22.
//

import SwiftUI

struct AddOneItemView: View {
  var billTitle: String
  var billDescription: String
  var billDate: String
  @Binding var billItems: [BillItem]
  @State var billItemsObject : BillItems = BillItems()
  @ObservedObject var addFriendViewModel: AddFriendViewModel
  
  @State private var itemName: String = ""
  @State private var itemPrice: String = ""
  
  func addItemToArray() {
    billItems.append(BillItem(email: "", name: itemName, price: itemPrice, user_full_name: ""))
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
          TextField("Enter a Title: ", text: $itemName)
          TextField("Enter a price: $", text: $itemPrice)
        }
      }
      NavigationLink(destination: Manually_AddItem(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: billItemsObject, addFriendViewModel: addFriendViewModel).navigationBarBackButtonHidden(true)) {
        Text("Add Item")
      }
      .padding()
      .foregroundColor(.white)
      .background(Color(red: 76/255, green: 229/255, blue: 177/255))
      .clipShape(Capsule())
      .simultaneousGesture(TapGesture().onEnded {
        addItemToArray()
        billItemsObject.bill_items = billItems
      })
      Spacer()
    }
  }
}
