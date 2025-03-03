//
//  SheetA2.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 11/9/2024.
//

import SwiftUI

struct SheetA2: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator2
  
  var body: some View {
    VStack {
      Button("Push To stack B") {
        navigationCoordinator.present(.stack(.stackB))
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present sheet B") {
        navigationCoordinator.present(.sheet(.sheetB))
      }
      .buttonStyle(.borderedProminent)
      
      Button("Present fullscreen A") {
        navigationCoordinator.present(.fullScreen(.fullScreenA))
      }
      .buttonStyle(.borderedProminent)
      
      Button("Dismiss") {
        navigationCoordinator.dismiss()
      }
      .buttonStyle(.borderedProminent)
    }
    .navigationTitle("Sheet A2")
  }
}

#Preview {
  SheetA2()
}
