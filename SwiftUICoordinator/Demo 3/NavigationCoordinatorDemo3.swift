//
//  NavigationCoordinatorDemo3.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import SwiftUI

struct NavigationCoordinatorDemo3: View {
  @StateObject private var navigationCoordinator = NavigationCoordinator3()
  
  var body: some View {
    VStack {
      NavigationStack(path: $navigationCoordinator.path) {
        StackA3()
          .presentation2($navigationCoordinator.presentation)
      }
      .environmentObject(navigationCoordinator)
      
      Text("path count: \(navigationCoordinator.path.count)")
    }
  }
}

#Preview {
  NavigationCoordinatorDemo3()
}
