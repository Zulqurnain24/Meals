//
//  MealsModel.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import Foundation

struct MealModel: Decodable, Identifiable {
  var id = UUID()
  let idMeal: String
  let title: String
  let instructions: String
  let image: String
  let youtube: String
  
  enum CodingKeys: String, CodingKey {
    case idMeal = "idMeal"
    case title = "strMeal"
    case instructions = "strInstructions"
    case youtube = "strYoutube"
    case image = "strMealThumb"
  }
}
