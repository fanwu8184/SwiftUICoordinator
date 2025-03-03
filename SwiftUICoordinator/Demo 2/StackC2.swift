//
//  StackC2.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 11/9/2024.
//

import SwiftUI

struct StackC2: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator2
  
  var body: some View {
    VStack {
      Button("Present sheet A") {
        navigationCoordinator.present(.sheet(.sheetA))
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen A") {
        navigationCoordinator.present(.fullScreen(.fullScreenA))
      }
      .buttonStyle(.borderedProminent)
      
      Button("pop to root") {
        navigationCoordinator.popToRoot()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Stack C2")
  }
}

#Preview {
  StackC2()
}
