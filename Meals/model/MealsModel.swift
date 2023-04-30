//
//  MealsModel.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import Foundation

struct MealsListModel: Decodable {
  let meals: [MealModel]
}

extension MealsListModel: Equatable {
  static func == (lhs: MealsListModel, rhs: MealsListModel) -> Bool {
    lhs.meals.count ==  rhs.meals.count
  }
}

extension MealsListModel: Identifiable {
  var id: String { UUID().uuidString }
}
