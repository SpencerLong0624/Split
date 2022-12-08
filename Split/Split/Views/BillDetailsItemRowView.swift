//
//  BillDetailsItemRowView.swift
//  Split
//
//  Created by Anthony A Lees on 12/8/22.
//

import SwiftUI

struct BillDetailsItemRowView: View {
  var item_group : [String]
  
  var body: some View {
    HStack {
      Text(item_group[0])
      .frame(maxWidth: .infinity, alignment: .leading)
      Text("$\(item_group[1])")
      .frame(maxWidth: .infinity, alignment: .center)
      Text(item_group[2])
      .frame(maxWidth: .infinity, alignment: .center)
    }
  }
}
