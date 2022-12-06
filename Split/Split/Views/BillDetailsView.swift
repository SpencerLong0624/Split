//
//  BillDetailsView.swift
//  Split
//
//  Created by Anthony A Lees on 11/5/22.
//

import SwiftUI

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
      Text("Items:")
      .font(.title3)
      .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
      .padding(5)
      ForEach(bill.items.indices, id: \.self) {
        if $0 % 2 == 0 {
          Text("Name: " + self.bill.items[$0])
        } else {
          Text("Price: $" + self.bill.items[$0])
        }
      }
    }
    .navigationBarTitle("Bill Details")
  }
}
