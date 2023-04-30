//
//  RootFeature.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import ComposableArchitecture

struct RootState {
  var mealState = MealState()
}

enum RootAction {
  case mealAction(MealAction)
}

struct RootEnvironment {}

// swiftlint:disable trailing_closure
let rootReducer = Reducer<
  RootState,
  RootAction,
  SystemEnvironment<RootEnvironment>
>.combine(
  mealReducer.pullback(
    state: \.mealState,
    action: /RootAction.mealAction,
    environment: { _ in
        .dev(
        environment: MealEnvironment(mealRequest: mealEffect))
    }))
// swiftlint:enable trailing_closure
