//
//  StackA4.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct StackA4: View {
  @EnvironmentObject private var navigationCoordinator: NavigationCoordinator4
  
  var body: some View {
    VStack {
//      NavigationLink(destination: Text("Second View"), tag: "Second", selection: $navigationCoordinator.stack.last?.rawValue) { EmptyView() }
      
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
    }
    .navigationTitle("Stack A4")
  }
}

#Preview {
  StackA4()
}
