//
//  Manually_AddItem.swift
//  Split
//
//  Created by Muhammad Uzair Umar on 11/9/22.
//

import SwiftUI

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
        .padding(9.0)
          .background(Color.green)
          .foregroundColor(.white)
          .clipShape(Capsule())
          .scaleEffect(configuration.isPressed ? 1.2 : 1)
          .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct Manually_AddItem: View {
  
  private var curBillItems: [BillItem] =
  [
    BillItem(bill_id: "1", name: "milk", price: 1),
    BillItem(bill_id: "1", name: "rice", price: 2)
  ]
  
    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          Text("Bill Title")
            .font(.title)
          Spacer()
            .frame(minWidth: 50, idealWidth: 210, maxWidth: 210)
            .fixedSize()
          Text("Date")
        }
        Text("Bill Description")
        Divider()
          .frame(width: 360, height: 1)
          .overlay(.black)
        Text("Friends")
          .font(.title)
        Spacer()
          .frame(minHeight: 20, idealHeight: 20, maxHeight: 20)
          .fixedSize()
        Text("Items")
          .font(.title)
        HStack {
          Spacer().frame(width: UIScreen.main.bounds.width/2 - 70, height: 0)
          NavigationLink(destination: AddOneItemView()) {
            Text("Add Item")
          }
          .buttonStyle(GreenButton())
          Spacer().frame(width: UIScreen.main.bounds.width/2 - 70, height: 0)
        }
        Form {
          // need billitems to follow Identifiable Protocol because right now ForEach cannot differntiate unique bill items
          LabeledContent("Item", value: "Price ($)")
          ForEach(curBillItems, id: \.bill_id) { item in
            LabeledContent(
              item.name,
              value: item.priceString
            )
          }
        }
      }
      .padding(.leading)
    }
}

struct Manually_AddItem_Previews: PreviewProvider {
    static var previews: some View {
        Manually_AddItem()
    }
}


// May  be useful for adding bar title on top
//          .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    VStack {
//                      Text("Title").font(.title)
//                        Text("Subtitle").font(.subheadline)
//                    }
//                }
//            }
