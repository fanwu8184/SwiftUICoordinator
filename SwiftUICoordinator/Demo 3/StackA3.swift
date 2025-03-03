//
//  StackA3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct StackA3: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator3
  
  var body: some View {
    VStack {
      Button("Push To stack B") {
        navigationCoordinator.present(
          .stack(
            AnyView(
              StackB3()
            )
          )
        )
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present sheet A") {
        navigationCoordinator.present(
          .sheet(
            AnyView(
              NavigationStack {
                SheetA3()
              }
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
    }
    .navigationTitle("Stack A3")
  }
}

#Preview {
  StackA3()
}
