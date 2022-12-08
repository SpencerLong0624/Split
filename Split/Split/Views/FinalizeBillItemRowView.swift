//
//  FinalizeBillItemRowView.swift
//  Split
//
//  Created by Spencer Long on 12/7/22.
//

import SwiftUI

struct FinalizeBillItemRowView: View {
  var item: BillItem
  
  var body: some View {
    HStack {
      Text(item.name)
      .frame(maxWidth: .infinity, alignment: .leading)
      Text("$\(item.price)")
      .frame(maxWidth: .infinity, alignment: .center)
      Text(item.assignedPerson.personName)
      .frame(maxWidth: .infinity, alignment: .center)
    }
  }
}
