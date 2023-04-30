//
//  MealsApp.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import SwiftUI
import ComposableArchitecture

@main
struct AppMain: App {
  var body: some Scene {
    WindowGroup {
      RootView(
        store: Store(
          initialState: RootState(),
          reducer: rootReducer,
          environment: .live(environment: RootEnvironment())))
    }
  }
}
