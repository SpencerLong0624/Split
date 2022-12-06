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
      .font(.subheadline)
      .fontWeight(.bold)
      .frame(maxHeight: .infinity, alignment: .leading)
      NavigationLink(destination: Manually_AddItem(billTitle: billTitle, billDescription: billDescription, billDate: DateToString(date: billDate), billItems: billItems, addFriendViewModel: addFriendViewModel)) {
        Text("Add Items Manually")
        .foregroundColor(Color.green)
      }
      .frame(maxHeight: .infinity, alignment: .center)
      NavigationLink(destination: ReceiptScanView(addFriendViewModel: addFriendViewModel, billTitle: billTitle, billDescription: billDescription, billDate: DateToString(date: billDate))) {
        Text("Scan Receipts")
        .foregroundColor(Color.green)
      }
      .frame(maxHeight: .infinity, alignment: .trailing)
    }
  }
}
