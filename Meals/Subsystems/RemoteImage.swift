//
//  RemoteImage.swift
//  Meals
//
//  Created by Muhammad Zulqurnain on 30/04/2023.
//

import SwiftUI

struct RemoteImage: View {
let url: String
var body: some View {
    AsyncImage(url: URL(string: url)) { phase in
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
                .resizable()
        case .failure:
            Image(systemName: "xmark")
                .resizable()
                .foregroundColor(.red)
        @unknown default:
            ProgressView()
        }
    }
}
}
