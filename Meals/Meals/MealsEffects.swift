//
//  MealsEffects.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import Foundation
import ComposableArchitecture

func mealEffect(decoder: JSONDecoder) -> Effect<MealsListModel, APIError> {
  guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=Chicken") else {
    fatalError("Error on creating url")
  }
  return URLSession.shared.dataTaskPublisher(for: url)
    .mapError { _ in APIError.downloadError }
    .map { data, _ in data }
    .decode(type: MealsListModel.self, decoder: decoder)
    .mapError { _ in APIError.decodingError }
    .eraseToEffect()
}

func dummyRepositoryEffect(decoder: JSONDecoder) -> Effect<MealsListModel, APIError> {
  let dummyRepositories = MealsListModel(meals: [
    MealModel(id: UUID(), idMeal: "122", title: "Chicken Haleem", instructions: "(1)Put hot water (2)Put masala (3)Put chicken (4)Put coriandar (5)Put brown onion (6)Simmer till it gets brown", image: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg", youtube: "abc.com"/*, ingredient1: "chicken", ingredient2: "Brown", ingredient3: "Coriandar", ingredient4: "zeera", ingredient5: "Green chilly", ingredient6: "clove", ingredient7: "Masala", ingredient8: "Lemon", ingredient9: "", ingredient10: "", ingredient11: "", ingredient12: "", ingredient13: "", ingredient14: "", ingredient15: "", ingredient16: "", ingredient17: "", ingredient18: "", ingredient19: "", ingredient20: "", measure1: "", measure2: "", measure3: "", measure4: "", measure5: "", measure6: "", measure7: "", measure8: "", measure9: "", measure10: "", measure11: "", measure12: "", measure13: "", measure14: "", measure15: "", measure16: "", measure17: "", measure18: "", measure19: "", measure20: ""*/),
    MealModel(id: UUID(), idMeal: "21", title: "Beef Haleem", instructions: "(1)Put hot water (2)Put masala (3)Put chicken (4)Put coriandar (5)Put brown onion (6)Simmer till it gets brown", image: "https://www.themealdb.com/images/media/meals/1529444830.jpg", youtube: "abc.com"/*, ingredient1: "chicken", ingredient2: "Brown", ingredient3: "Coriandar", ingredient4: "zeera", ingredient5: "Green chilly", ingredient6: "clove", ingredient7: "Masala", ingredient8: "Lemon", ingredient9: "", ingredient10: "", ingredient11: "", ingredient12: "", ingredient13: "", ingredient14: "", ingredient15: "", ingredient16: "", ingredient17: "", ingredient18: "", ingredient19: "", ingredient20: "", measure1: "", measure2: "", measure3: "", measure4: "", measure5: "", measure6: "", measure7: "", measure8: "", measure9: "", measure10: "", measure11: "", measure12: "", measure13: "", measure14: "", measure15: "", measure16: "", measure17: "", measure18: "", measure19: "", measure20: ""*/),
  ]) 
  return Effect(value: dummyRepositories)
}
