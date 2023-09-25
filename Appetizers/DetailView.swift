//
//  DetailView.swift
//  Appetizers
//
//  Created by robin tetley on 25/09/2023.
//

import SwiftUI

struct DetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.medium)
            Text(appetizer.description)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
            HStack {
                VStack {
                    Text("Calories")
                        .font(.title3)
                    Text("\(appetizer.calories)")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .italic()
                }
                VStack {
                    Text("Calories")
                        .font(.title3)
                    Text("\(appetizer.calories)")
                }
                VStack {
                    Text("Calories")
                        .font(.title3)
                    Text("\(appetizer.calories)")
                }
            }
            Text("$11.49 - Add To Order")
                .frame(width: 280, height: 50)
                .background(Color.brandPrimary)
                .foregroundColor(.white)
                .font(.title2)
                .fontWeight(.bold)
                .cornerRadius(10)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(appetizer: MockData.sampleAppetizer)
    }
}
