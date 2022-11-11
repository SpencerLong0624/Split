//
//  BillItemRow.swift
//  Split
//
//  Created by Spencer Long on 11/10/22.
//

import SwiftUI

struct BillItemRowView: View {
  
  var item: BillItem
  
  var body: some View {
    HStack {
      Text(item.name)
        .frame(maxWidth: .infinity, alignment: .leading)
      Text("$\(item.price)")
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
  }
}

