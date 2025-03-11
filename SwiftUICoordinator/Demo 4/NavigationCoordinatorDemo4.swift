// the way not using NavigationStack

import SwiftUI

struct NavigationCoordinatorDemo4: View {
  @StateObject private var navigationCoordinator = NavigationCoordinator4()
  
  var body: some View {
    VStack {
      NavigationView {
        VStack {
          if let stack = navigationCoordinator.stack.last {
            navigationCoordinator.create(stack: stack)
              .transition(.scale)
          } else {
            navigationCoordinator.create(stack: .stackA)
          }
        }
        .sheet(item: $navigationCoordinator.sheet) {
          navigationCoordinator.create(sheet: $0)
        }
        .fullScreenCover(item: $navigationCoordinator.fullScreen) {
          navigationCoordinator.create(fullScreen: $0)
        }
      }
      .environmentObject(navigationCoordinator)
      
      Text("Current Stack: \(navigationCoordinator.stack.count)")
    }
  }
}

#Preview {
  NavigationCoordinatorDemo4()
}
