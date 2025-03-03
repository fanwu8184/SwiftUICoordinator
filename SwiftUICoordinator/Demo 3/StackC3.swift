//
//  StackC3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct StackC3: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator3
  
  var body: some View {
    VStack {
      Button("Present sheet A") {
        navigationCoordinator.present(
          .sheet(
            AnyView(
              SheetA3()
            )
          )
        )
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen A") {
        navigationCoordinator.present(
          .fullScreen(
            AnyView(
              FullScreenA3()
            )
          )
        )
      }
      .buttonStyle(.borderedProminent)
      
      Button("pop to root") {
        navigationCoordinator.popToRoot()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Stack C3")
  }
}

#Preview {
  StackC3()
}
