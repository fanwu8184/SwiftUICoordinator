import SwiftUI

struct SheetB5: View {
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator5
    
    var body: some View {
      VStack {
        Button("Dismiss") {
          navigationCoordinator.dismiss()
        }
        .buttonStyle(.borderedProminent)
      }
      .navigationTitle("Sheet B5")
    }
}

#Preview {
    SheetB5()
}
