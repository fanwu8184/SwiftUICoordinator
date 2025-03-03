//
//  StackB3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct StackB3: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator3
  
  var body: some View {
    VStack {
      Button("Push To stack C") {
        navigationCoordinator.present(
          .stack(
            AnyView(
              StackC3()
            )
          )
        )
      }
      .buttonStyle(.borderedProminent)
      
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
      
      Button("pop") {
        navigationCoordinator.pop()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Stack B3")
  }
}

#Preview {
  StackB3()
}
