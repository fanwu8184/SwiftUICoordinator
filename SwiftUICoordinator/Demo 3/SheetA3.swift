//
//  SheetA3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct SheetA3: View {
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
      
      Button("Present sheet B") {
        navigationCoordinator.present(
          .sheet(
            AnyView(
              SheetB3()
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
    .navigationTitle("Sheet A3")
  }
}

#Preview {
  SheetA3()
}
