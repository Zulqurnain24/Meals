//
//  MealsView.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import SwiftUI
import Combine
import ComposableArchitecture

struct MealsListView: View {
  @State var store: Store<MealState, MealAction>
  
  var body: some View {
    WithViewStore(self.store) { viewStore in
      Text("Chicken Recipes").font(.title)
      List(viewStore.mealsList.meals) { meal in
        MealView(meal: meal)
      }
      .onAppear{
        viewStore.send(.onAppear)
      }
    }
    .navigationBarTitleDisplayMode(.automatic)
  }
}

struct MealView: View {
  @State var meal: MealModel

  var body: some View {
    RemoteImage(url: meal.image)
      .aspectRatio(contentMode: .fit)
      .frame(height: 300)
    Text(meal.title)
    Text("Instructions:")
    Text(meal.instructions)
  }
}

struct MealListView_Previews: PreviewProvider {
  static var previews: some View {
    MealsListView(
      store: Store(
        initialState: MealState(),
        reducer: mealReducer,
        environment: .dev(
          environment: MealEnvironment(
            mealRequest: dummyRepositoryEffect))))
  }
}

