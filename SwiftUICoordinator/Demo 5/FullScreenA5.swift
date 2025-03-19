//
//  FullScreenA5.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 19/3/2025.
//

import SwiftUI

struct FullScreenA5: View {
    @EnvironmentObject private var navigationCoordinator: NavigationCoordinator5
    
    var body: some View {
      VStack {
        Button("Push To stack B") {
            navigationCoordinator.present(style: .stack) {
                StackB5()
            }
        }
        .buttonStyle(.borderedProminent)
        
        Button("Present sheet A") {
            navigationCoordinator.present(style: .sheet()) {
                SheetA5()
            }
        }
        .buttonStyle(.borderedProminent)
        
        Button("Present fullscreen B") {
            navigationCoordinator.present(style: .fullScreen) {
                FullScreenB5()
            }
        }
        .buttonStyle(.borderedProminent)
        
        Button("Dismiss") {
          navigationCoordinator.dismiss()
        }
        .buttonStyle(.borderedProminent)
      }
      .navigationTitle("FullScreen A5")
    }
}

#Preview {
    FullScreenA5()
}
