//
//  FullScreenA3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct FullScreenA3: View {
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
              SheetA3()
            )
          )
        )
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen B") {
        navigationCoordinator.present(
          .fullScreen(
            AnyView(
              FullScreenB3()
            )
          )
        )
      }
      .buttonStyle(.borderedProminent)
      
      Button("Dismiss") {
        navigationCoordinator.dismiss()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("FullScreen A2")
  }
}

#Preview {
    FullScreenA3()
}
