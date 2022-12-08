//
//  BillDetailsUserRowView.swift
//  Split
//
//  Created by Anthony A Lees on 12/8/22.
//

import SwiftUI

struct BillDetailsUserRowView: View {
  var user_group : [String]
  
  var body: some View {
    HStack {
      Text(user_group[0])
      .frame(maxWidth: .infinity, alignment: .leading)
      Text("$\(user_group[1])")
      .frame(maxWidth: .infinity, alignment: .center)
    }
  }
}
