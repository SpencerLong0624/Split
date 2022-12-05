//
//  BillViewModel.swift
//  Split
//
//  Created by Anthony A Lees on 11/5/22.
//

import Foundation
import Combine

class BillViewModel: ObservableObject, Identifiable {

  private let billRepository = BillRepository()
  @Published var bill: Bill
  private var cancellables: Set<AnyCancellable> = []
  var id = ""

  init(bill: Bill) {
    self.bill = bill
    $bill
    .compactMap { $0.id }
    .assign(to: \.id, on: self)
    .store(in: &cancellables)
  }

  func update(bill: Bill) {
    billRepository.update(bill)
  }

  func remove() {
    billRepository.remove(bill)
  }
}
