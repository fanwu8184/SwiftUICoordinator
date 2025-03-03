//
//  SheetB.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 6/9/2024.
//

import SwiftUI

struct SheetB: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator
  
  var body: some View {
    VStack {
      Button("Dismiss") {
        navigationCoordinator.dismissSheet()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Sheet B")
  }
}

#Preview {
  SheetB()
}
