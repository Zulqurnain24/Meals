//
//  MealsTests.swift
//  MealsTests
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import Combine
import ComposableArchitecture
import XCTest
@testable import Meals

class MealSearchTests: XCTestCase {
  let testScheduler = DispatchQueue.test
  var testMealList: MealsListModel = MealsListModel(meals: [MealModel.mockMeal])

  func testMealEffect(decoder: JSONDecoder) -> Effect<MealsListModel, APIError> {
    return Effect(value: testMealList)
  }

  func testOnAppear() {
    let store = TestStore(
      initialState: MealState(),
      reducer: mealReducer,
      environment: SystemEnvironment(
        environment: MealEnvironment(
          mealRequest: testMealEffect),
        mainQueue: { self.testScheduler.eraseToAnyScheduler() },
        decoder: { JSONDecoder() }))

    store.send(.onAppear)
    testScheduler.advance()
    store.receive(.dataLoaded(.success(testMealList))) { state in
      state.mealsList = self.testMealList
    }
  }
}

extension MealModel {
  static let mockMeal = MealModel(idMeal: "1", title: "Chicken Handi", instructions: "Take a large pot or wok, big enough to cook all the chicken, and heat the oil in it. Once the oil is hot, add sliced onion and fry them until deep golden brown. Then take them out on a plate and set aside.\r\nTo the same pot, add the chopped garlic and sauté for a minute. Then add the chopped tomatoes and cook until tomatoes turn soft. This would take about 5 minutes.\r\nThen return the fried onion to the pot and stir. Add ginger paste and sauté well.\r\nNow add the cumin seeds, half of the coriander seeds and chopped green chillies. Give them a quick stir.\r\nNext goes in the spices – turmeric powder and red chilli powder. Sauté the spices well for couple of minutes.\r\nAdd the chicken pieces to the wok, season it with salt to taste and cook the chicken covered on medium-low heat until the chicken is almost cooked through. This would take about 15 minutes. Slowly sautéing the chicken will enhance the flavor, so do not expedite this step by putting it on high heat.\r\nWhen the oil separates from the spices, add the beaten yogurt keeping the heat on lowest so that the yogurt doesn’t split. Sprinkle the remaining coriander seeds and add half of the dried fenugreek leaves. Mix well.\r\nFinally add the cream and give a final mix to combine everything well.\r\nSprinkle the remaining kasuri methi and garam masala and serve the chicken handi hot with naan or rotis. Enjoy!", image: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg", youtube: "https://www.youtube.com/watch?v=IO0issT0Rmc")
}
