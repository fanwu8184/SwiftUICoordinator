//
//  SheetA.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 6/9/2024.
//

import SwiftUI

struct SheetA: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator
  
  var body: some View {
    VStack {
      Button("Push To stack B") {
        navigationCoordinator.push(.stackB)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present sheet B") {
        navigationCoordinator.present(sheet: .sheetB)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen A") {
        navigationCoordinator.present(fullScreen: .fullScreenA)
      }
      .buttonStyle(.borderedProminent)
      
      Button("Dismiss") {
        navigationCoordinator.dismissSheet()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Sheet A")
  }
}

#Preview {
  SheetA()
}
