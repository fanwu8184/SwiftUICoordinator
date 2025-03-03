//
//  FullScreenB4.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct FullScreenB4: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator4
  
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
      
      Button("Present fullscreen A") {
        navigationCoordinator.present(fullScreen: .fullScreenA)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Dismiss") {
        navigationCoordinator.dismissFullScreen()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("FullScreen B4")
  }
}

#Preview {
  FullScreenB4()
}
