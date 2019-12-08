//
//  ContentView.swift
//  UITest
//
//  Created by Osvaldo Murillo on 10/7/19.
//  Copyright © 2019 Osvaldo Murillo. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var categories:[String:[Drink]] {
        .init(
            grouping: drinkData,
            by: {$0.category.rawValue}
        )
    }
    var body: some View {
        NavigationView {
            List (categories.keys.sorted(), id: \String.self) {key in
                DrinkRow(categoryName: "\(key) Drinks ".uppercased(), drinks: self.categories[key]!)
                    .frame(height: 300)
                    .padding(.top)
                    .padding(.bottom)
                
                } .navigationBarTitle("Raynier Coffee")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environment(\.colorScheme, .light)
    }
}
