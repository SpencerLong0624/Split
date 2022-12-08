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
  
  var body: some View {
    VStack {
      Text(bill.title)
        .font(.title)
        .fontWeight(.black)
        .padding([.top], 40)
      Text(bill.description)
        .font(.title3)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .padding(5)
      Text("Date: \(bill.date)")
        .font(.headline)
        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        .foregroundColor(.secondary)
        .padding(20)
      Section(header: Text("Items")) {
        List {
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
      Spacer()
    }
    .navigationBarTitle("Bill Details")
  }
  
  func generateItemGroups(_ bill: Bill) -> [[String]] {
    var item_array : [[String]] = []
    for i in stride(from: 2, to: bill.items.count, by: 3) {
      var curr_item_group : [String] = []
      print(i)
      curr_item_group.append(bill.items[i - 2])
      curr_item_group.append(bill.items[i - 1])
      curr_item_group.append(bill.items[i])
      item_array.append(curr_item_group)
    }
    
    return item_array
  }
}
