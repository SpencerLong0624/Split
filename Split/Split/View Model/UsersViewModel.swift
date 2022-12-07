//
//  UsersViewModel.swift
//  Split
//
//  Created by Anthony A Lees on 12/5/22.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
  @Published var userViewModels: [UserViewModel] = []
  private var cancellables: Set<AnyCancellable> = []

  @Published var userRepository = UserRepository()
  @Published var users: [User] = []
  @Published var filteredUserViewModels: [UserViewModel] = []
  
  init() {
    userRepository.$users.map { users in
      users.map(UserViewModel.init)
    }
    .assign(to: \.userViewModels, on: self)
    .store(in: &cancellables)
  }

  func add(_ user: User) {
    userRepository.add(user)
  }

  func search(searchText: String) {
    self.filteredUserViewModels = self.userViewModels.filter { userViewModel in
      return userViewModel.user.email.lowercased().contains(searchText.lowercased())
    }
  }
  
  func getUser(email: String) -> [UserViewModel] {
    let user = userViewModels.filter {userViewModel in
      return userViewModel.user.email.lowercased().contains(email.lowercased())
    }
    return user
  }
}
