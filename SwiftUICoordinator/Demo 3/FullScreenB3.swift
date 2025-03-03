//
//  FullScreenB3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct FullScreenB3: View {
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
      
      Button("Dismiss") {
        navigationCoordinator.dismiss()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("FullScreen B2")
  }
}

#Preview {
    FullScreenB3()
}
