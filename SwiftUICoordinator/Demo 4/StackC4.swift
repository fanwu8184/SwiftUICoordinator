//
//  StackC4.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct StackC4: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator4
  
  var body: some View {
    VStack {
      Button("Present sheet A") {
        navigationCoordinator.present(sheet: .sheetA)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen A") {
        navigationCoordinator.present(fullScreen: .fullScreenA)
      }
      .buttonStyle(.borderedProminent)
      
      Button("pop to root") {
        navigationCoordinator.popToRoot()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Stack C4")
  }
}

#Preview {
    StackC4()
}
