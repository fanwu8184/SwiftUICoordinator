// using Presentation to combine all type of presentations: sheet, fullScreen, and navigationDestination

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
