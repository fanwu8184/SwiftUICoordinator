//
//  SheetB3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct SheetB3: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator3
  
  var body: some View {
    VStack {
      Button("Dismiss") {
        navigationCoordinator.dismiss()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Sheet B2")
  }
}

#Preview {
  SheetB3()
}
