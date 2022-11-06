//
//  ActivityViewModel.swift
//  Split
//
//  Created by Anthony A Lees on 11/5/22.
//

import Foundation
import Combine

class ActivityViewModel: ObservableObject {
  @Published var billViewModels: [BillViewModel] = []
  private var cancellables: Set<AnyCancellable> = []

  @Published var billRepository = BillRepository()
  @Published var activity: [Bill] = []
  
  init() {
    billRepository.$bills.map { bills in
      bills.map(BillViewModel.init)
    }
    .assign(to: \.billViewModels, on: self)
    .store(in: &cancellables)
  }

  func add(_ bill: Bill) {
    billRepository.add(bill)
  }
}
