//
//  AddItemView.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/6/22.
//

import SwiftUI

struct AddItemView: View {
  var billTitle: String
  var billDescription: String
  var billDate: Date
  @State var billItems = BillItems()
  @ObservedObject var addFriendViewModel: AddFriendViewModel

  func DateToString(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/YYYY"
    return dateFormatter.string(from: self.billDate)
  }
  
  
  var body: some View {
    VStack {
      Text("How do you want to enter items?")
        .font(.title3)
        .fontWeight(.bold)
        .frame(maxHeight: .infinity, alignment: .leading)
      NavigationLink(destination: Manually_AddItem(billTitle: billTitle, billDescription: billDescription, billDate: DateToString(date: billDate), billItems: billItems, addFriendViewModel: addFriendViewModel)) {
        Text("Add Items Manually")
        .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
      }
      .frame(maxHeight: .infinity, alignment: .center)
      NavigationLink(destination: ReceiptScanView(addFriendViewModel: addFriendViewModel, billTitle: billTitle, billDescription: billDescription, billDate: DateToString(date: billDate))) {
        Text("Scan Receipts")
        .foregroundColor(Color(red: 76/255, green: 229/255, blue: 177/255))
      }
      .frame(maxHeight: .infinity, alignment: .trailing)
    }
    .frame(
          minWidth: 0,
          maxWidth: .infinity,
          minHeight: 0,
          maxHeight: .infinity
        )
    .background(Color(.systemGroupedBackground))
  }
}
