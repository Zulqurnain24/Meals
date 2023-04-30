//
//  RootView.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
  let store: Store<RootState, RootAction>
  var body: some View {
    WithViewStore(self.store.stateless) { _ in
      MealsListView(
        store: store.scope(
          state: \.mealState,
          action: RootAction.mealAction))
      .accentColor(Color.white)
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    let rootView = RootView(
      store: Store(
        initialState: RootState(),
        reducer: rootReducer,
        environment: .dev(environment: RootEnvironment())))
    return rootView
  }
}
