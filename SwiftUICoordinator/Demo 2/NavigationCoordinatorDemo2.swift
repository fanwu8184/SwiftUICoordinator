//
//  NavigationCoordinatorDemoTwo.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 6/9/2024.
//

import SwiftUI

struct NavigationCoordinatorDemo2: View {
  @StateObject private var navigationCoordinator = NavigationCoordinator2()
  
  var body: some View {
    VStack {
      NavigationStack(path: $navigationCoordinator.path) {
        navigationCoordinator.create(presentation: .stack(.stackA))
          .presentation($navigationCoordinator.presentation) {
            navigationCoordinator.create(presentation: $0)
          }
      }
      .environmentObject(navigationCoordinator)
      
      Text("path count: \(navigationCoordinator.path.count)")
    }
  }
}

#Preview {
  NavigationCoordinatorDemo2()
}
