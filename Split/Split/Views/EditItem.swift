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
  @State var curItem : BillItem
  
  @State var billItemsObject : BillItems = BillItems()
    
  @State private var itemName: String = ""
  @State private var itemPrice: String = ""
  
  func changeItem() {
    curItem.name = itemName
    curItem.price = itemPrice
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

          Section(){
            NavigationLink(destination: Manually_AddItem(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: billItemsObject)) {
              Text("Add Item")
             }
            .onTapGesture {
               changeItem()
           }
          }
        }
      }
    }
}
