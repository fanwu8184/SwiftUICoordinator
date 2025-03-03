//
//  StackB2.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 11/9/2024.
//

import SwiftUI

struct StackB2: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator2
  
  var body: some View {
    VStack {
      Button("Push To stack C") {
        navigationCoordinator.present(.stack(.stackC))
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
      
      Button("pop") {
        navigationCoordinator.pop()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Stack B2")
  }
}

#Preview {
  StackB2()
}
