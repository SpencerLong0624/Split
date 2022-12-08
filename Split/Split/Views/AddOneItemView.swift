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
        
        Section(header: Text("Item Information")){
          TextField("Enter a Title: ", text: $itemName)
            .tint(.black)
          TextField("Enter a price: $", text: $itemPrice)
            .tint(.black)
        }
        
        Section {
          } footer: {
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
        }
      }
    }
  }
}
