//
//  NavigationCoordinator4.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 12/9/2024.
//

import Foundation
import SwiftUI

class NavigationCoordinator4: ObservableObject {
  @Published var stack: [Stack] = []
  @Published var sheet: Sheet?
  @Published var fullScreen: FullScreen?
  
  func push(_ page: Stack) {
    withAnimation {
      stack.append(page)
    }
  }
  
  func present(sheet: Sheet) {
    self.sheet = sheet
  }
  
  func present(fullScreen: FullScreen) {
    self.fullScreen = fullScreen
  }
  
  func pop() {
    stack.removeLast()
  }
  
  func popToRoot() {
    stack.removeAll()
  }
  
  func dismissSheet() {
    sheet = nil
  }
  
  func dismissFullScreen() {
    fullScreen = nil
  }
  
  @ViewBuilder
  func create(stack: Stack) -> some View {
    switch stack {
    case .stackA:
      StackA4()
    case .stackB:
      StackB4()
    case .stackC:
      StackC4()
    }
  }
  
  @ViewBuilder
  func create(sheet: Sheet) -> some View {
    NavigationView {
      switch sheet {
      case .sheetA:
        SheetA4()
      case .sheetB:
        SheetB4()
      }
    }
  }
  
  @ViewBuilder
  func create(fullScreen: FullScreen) -> some View {
    NavigationView {
      switch fullScreen {
      case .fullScreenA:
        FullScreenA4()
      case .fullScreenB:
        FullScreenB4()
      }
    }
  }
}
