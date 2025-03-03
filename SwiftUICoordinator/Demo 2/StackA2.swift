//
//  StackA2.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 11/9/2024.
//

import SwiftUI

struct StackA2: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator2
  
  var body: some View {
    VStack {
      Button("Push To stack B") {
        navigationCoordinator.present(.stack(.stackB))
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present sheet A") {
        navigationCoordinator.present(.sheet(.sheetA))
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen A") {
        navigationCoordinator.present(.fullScreen(.fullScreenA))
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Stack A2")
  }
}

#Preview {
  StackA2()
}
