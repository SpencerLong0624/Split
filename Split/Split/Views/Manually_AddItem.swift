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
  
  var billTitle: String
  var billDescription: String
  var billDate: String
  @ObservedObject var billItems : BillItems
  @ObservedObject var activityViewModel = ActivityViewModel()
  
  @State var editIsActive = false
  
  func deleteItem(at offsets: IndexSet) {
    billItems.bill_items.remove(atOffsets: offsets)
  }
  
    var body: some View {
      VStack {
        HStack {
          Text("\(billTitle)")
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
          Text("\(billDate)")
            .frame(maxWidth: .infinity, alignment: .trailing)
          Spacer()
            .frame(width: 10)
        }
        Text("\(billDescription)")
          .frame(maxWidth: .infinity, alignment: .leading)
        Divider()
          .frame(width: 360, height: 1)
          .overlay(.black)
        Text("Friends")
          .font(.title)
          .frame(maxWidth: .infinity, alignment: .leading)
        Spacer()
          .frame(minHeight: 20, idealHeight: 20, maxHeight: 20)
          .fixedSize()
        Text("Items")
          .font(.title)
          .frame(maxWidth: .infinity, alignment: .leading)
        if billItems.bill_items.isEmpty == true {
          NavigationLink(destination: AddOneItemView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: $billItems.bill_items)) {
            Text("Add Item")
          }
          .buttonStyle(GreenButton())
        } else {
          HStack {
            NavigationLink(destination: AddOneItemView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: $billItems.bill_items)) {
              Text("Add Item")
            }
            .buttonStyle(GreenButton())
            NavigationLink(destination: ActivityView()) {
              Text("Finalize Items")
            }
            .buttonStyle(GreenButton())
            .simultaneousGesture(TapGesture().onEnded { var items_array : [String] = []
              for bill_item in billItems.bill_items {
                items_array.append(bill_item.name)
                items_array.append(bill_item.price)
              }
              let bill : Bill = Bill(bill_owers: [], bill_payers: [], date: billDate, description: billDescription, title: billTitle, items: items_array)
              activityViewModel.add(bill) })
          }
        }
        List{
          HStack {
            Text("Item Name")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .leading)
            Text("Price ($)")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity, alignment: .trailing)
          }
          ForEach(billItems.bill_items) { Item in
            BillItemRowView(item: Item)
              .swipeActions(allowsFullSwipe: false) {
                Button(role: .destructive) {
                    print("Deleting Item")
                  if let index = billItems.bill_items.firstIndex(of: Item) {
                    billItems.bill_items.remove(at: index)
                  }
                 } label: {
                     Label("Delete", systemImage: "trash.fill")
                 }
                                
                Button {
                  editIsActive.toggle()
                } label: {
                  Label("Edit", systemImage: "dots")
                    .labelStyle(TitleOnlyLabelStyle())
                }
                .tint(.blue)
              }
          }
          NavigationLink(destination: AddOneItemView(billTitle: billTitle, billDescription: billDescription, billDate: billDate, billItems: $billItems.bill_items), isActive: $editIsActive) {
            Label("Edit", systemImage: "dots")
              .labelStyle(TitleOnlyLabelStyle())
          }
          .hidden()
        }
        
      }
      .padding(.leading)
    }
}
