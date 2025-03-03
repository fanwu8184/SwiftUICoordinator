//
//  SheetB4.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct SheetB4: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator4
  
  var body: some View {
    VStack {
      Button("Dismiss") {
        navigationCoordinator.dismissSheet()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Sheet B4")
  }
}

#Preview {
  SheetB4()
}
