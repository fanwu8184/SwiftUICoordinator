//
//  StackB4.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct StackB4: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator4
  
  var body: some View {
    VStack {
      Button("Push To stack C") {
        navigationCoordinator.push(.stackC)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present sheet A") {
        navigationCoordinator.present(sheet: .sheetA)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen A") {
        navigationCoordinator.present(fullScreen: .fullScreenA)
      }
      .buttonStyle(.borderedProminent)
      
      Button("pop") {
        navigationCoordinator.pop()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Stack B4")
  }
}

#Preview {
  StackB4()
}
