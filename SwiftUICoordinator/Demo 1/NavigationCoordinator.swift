//
//  NavigationCoordinator.swift
//  SwiftUICoordinator
//
//  Created by Fan Wu on 6/9/2024.
//

import Foundation
import SwiftUI

enum Stack: String {
  case stackA, stackB, stackC
}

enum Sheet: String, Identifiable {
  case sheetA, sheetB
  
  var id: String { rawValue }
}

enum FullScreen: String, Identifiable {
  case fullScreenA, fullScreenB
  
  var id: String { rawValue }
}

class NavigationCoordinator: ObservableObject {
  @Published var path = NavigationPath()
  @Published var sheet: Sheet?
  @Published var fullScreen: FullScreen?
  
  func push(_ page: Stack) {
    path.append(page)
  }
  
  func present(sheet: Sheet) {
    self.sheet = sheet
  }
  
  func present(fullScreen: FullScreen) {
    self.fullScreen = fullScreen
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeLast(path.count)
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
      StackA()
    case .stackB:
      StackB()
    case .stackC:
      StackC()
    }
  }
  
  @ViewBuilder
  func create(sheet: Sheet) -> some View {
    NavigationStack {
      switch sheet {
      case .sheetA:
        SheetA()
      case .sheetB:
        SheetB()
      }
    }
  }
  
  @ViewBuilder
  func create(fullScreen: FullScreen) -> some View {
    NavigationStack {
      switch fullScreen {
      case .fullScreenA:
        FullScreenA()
      case .fullScreenB:
        FullScreenB()
      }
    }
  }
}
