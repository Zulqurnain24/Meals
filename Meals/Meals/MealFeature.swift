//
//  MealFeature.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import Combine
import ComposableArchitecture
import Foundation

struct MealState: Equatable {
  var mealsList: MealsListModel = MealsListModel(meals: [])
}

enum MealAction: Equatable {
  case onAppear
  case dataLoaded(Result<MealsListModel, APIError>)
}

struct MealEnvironment {
  var mealRequest: (JSONDecoder) -> Effect<MealsListModel, APIError>
}

let mealReducer = Reducer<
  MealState,
  MealAction,
  SystemEnvironment<MealEnvironment>
> { state, action, environment in
  switch action {
  case .onAppear:
    return environment.mealRequest(environment.decoder())
      .receive(on: environment.mainQueue())
      .catchToEffect()
      .map(MealAction.dataLoaded)
  case .dataLoaded(let result):
    switch result {
    case .success(let mealsList):
      state.mealsList = mealsList
    case .failure(let error):
      print("error: \(error.localizedDescription)")
      break
    }
    return .none
  }
}
