//
//  ContentView.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 6/9/2024.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var navigationCoordinator = NavigationCoordinator()
  
  var body: some View {
    VStack {
      NavigationStack(path: $navigationCoordinator.path) {
        navigationCoordinator.create(stack: .stackA)
          .navigationDestination(for: Stack.self) {
            navigationCoordinator.create(stack: $0)
          }
          .sheet(item: $navigationCoordinator.sheet) {
            navigationCoordinator.create(sheet: $0)
          }
          .fullScreenCover(item: $navigationCoordinator.fullScreen) {
            navigationCoordinator.create(fullScreen: $0)
          }
      }
      .environmentObject(navigationCoordinator)
      
      Text("path count: \(navigationCoordinator.path.count)")
    }
  }
}

#Preview {
  ContentView()
}
