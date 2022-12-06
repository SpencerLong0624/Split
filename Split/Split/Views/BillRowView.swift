//
//  BillRowView.swift
//  Split
//
//  Created by Anthony A Lees on 11/5/22.
//

import SwiftUI

struct BillRowView: View {
  var bill: Bill
  
  var body: some View {
    NavigationLink(
      destination: BillDetailsView(bill: bill),
      label: {
        Text(bill.date)
        Text(bill.title)
        .fontWeight(.bold)
        .font(.body)
      }
    )
  }
}
