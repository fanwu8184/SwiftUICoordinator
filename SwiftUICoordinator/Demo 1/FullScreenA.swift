//
//  FullScreenA.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 6/9/2024.
//

import SwiftUI

struct FullScreenA: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator
  
  var body: some View {
    VStack {
      Button("Push To stack B") {
        navigationCoordinator.push(.stackB)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present sheet A") {
        navigationCoordinator.present(sheet: .sheetA)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen B") {
        navigationCoordinator.present(fullScreen: .fullScreenB)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Dismiss") {
        navigationCoordinator.dismissFullScreen()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("FullScreen A")
  }
}

#Preview {
  FullScreenA()
}
