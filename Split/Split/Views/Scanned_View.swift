//
//  Scanned_View.swift
//  test_apppp
//
//  Created by Muhammad Uzair Umar on 11/8/22.
//

import SwiftUI

struct Scanned_View: View {
   var scanned_output : [String]
   
   init(scanned_output: [String]) {
      self.scanned_output = scanned_output
   }
  
    var body: some View {
       Text(scanned_output.joined(separator: ", "))
    }
}

