// using AnyView to pass in

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
