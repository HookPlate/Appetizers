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
        GeometryReader { geo in
            VStack(spacing: 25) {
                Image("asian-flank-steak")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(appetizer.description)
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                Spacer()
                
                HStack(spacing: 30) {
                    VStack {
                        Text("Calories")
                            .font(.title3)
                        Text("\(appetizer.calories)")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack {
                        Text("Carbs")
                            .font(.title3)
                        Text("\(appetizer.calories)g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                    VStack {
                        Text("Protein")
                            .font(.title3)
                        Text("\(appetizer.calories)g")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                            .italic()
                    }
                }
                Spacer(minLength: 100)
                Spacer()
                Text("$11.49 - Add To Order")
                    .frame(width: 280, height: 50)
                    .background(Color.brandPrimary)
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .cornerRadius(10)
            }
            .frame(width: geo.size.width / 1.1, height: geo.size.height / 1.1)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(appetizer: MockData.sampleAppetizer)
    }
}
