import SwiftUI

struct SheetA5: View {
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator5
    
    var body: some View {
      VStack {
        Button("Push To stack B") {
            navigationCoordinator.present(style: .stack) {
                StackB5()
            }
        }
        .buttonStyle(.borderedProminent)
        
        Button("Present sheet B") {
            navigationCoordinator.present(style: .sheet()) {
                SheetB5()
            }
        }
        .buttonStyle(.borderedProminent)
        
        Button("Present fullscreen A") {
            navigationCoordinator.present(style: .fullScreen) {
                FullScreenA5()
            }
        }
        .buttonStyle(.borderedProminent)
        
        Button("Dismiss") {
          navigationCoordinator.dismiss()
        }
        .buttonStyle(.borderedProminent)
      }
      .navigationTitle("Sheet A5")
    }
}

#Preview {
    SheetA5()
}
