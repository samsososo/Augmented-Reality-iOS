//
//  HomeView.swift
//  Augmented Reality
//
//  Created by Sam on 20/3/2021.
//

import SwiftUI

struct HomeView: View {
    
    struct Course: Hashable {
        let name, imageName: String
        let numLessons: Int
        let totalTime: Float
        let description: String
        let dangerousRate: Int
    }
    let courses: [Course] = [
        .init(name: "Fire", imageName: "fire", numLessons: 35, totalTime: 10.35, description:"Fire is the disaster that does not discriminate.  No matter where you live or the age and condition of your home, there is always the chance that a fire could occur at any time and for any number of reasons.  Most homeowners realize this – in fact, it is probably the most common nightmare among people when they purchase their homes.  However, when fires actually do occur, few homeowners are prepared for the consequences.", dangerousRate: 5),
        .init(name: "Water", imageName: "water", numLessons: 50, totalTime: 20.5, description:"Water damage describes various possible losses caused by water intruding where it will enable attack of a material or system by destructive processes such as rotting of wood, mold growth, bacteria growth, rusting of steel, swelling of composite woods, de-laminating of materials such as plywood, etc. The damage may be imperceptibly slow and minor such as water spots that could eventually mar a surface, or it may be instantaneous and catastrophic such as burst pipes and flooding. However fast it occurs, water damage is a major contributor to loss of property.",dangerousRate: 3),
        .init(name: "Electronic", imageName: "electronic", numLessons: 44, totalTime: 16.3, description:"The first thing you must do is disconnect the power supply. Don’t even touch the victim until you are sure that the power supply is turned off. Be especially careful in wet areas, such as bathrooms, as water conducts electricity. It may be safer to turn off the electricity supply to the building if possible to be absolutely sure.",dangerousRate: 4)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(courses, id: \.self) { course in
                        Image(course.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(5)
                            .padding(.leading, 10)
                            .padding(.trailing, 10)
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(course.name).font(.system(size: 30, weight: .bold))
                            }
                            Spacer()
                            HStack {
                                ForEach(0..<course.dangerousRate){rate in
                                    Image(systemName: "exclamationmark.shield")
                                    .font(.system(size: 20, weight: .bold))
                                }
                            }.foregroundColor(.red)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(Color.black)
                            
                            .cornerRadius(16)
                        }.padding(.top, 8)
                        .padding(.horizontal)
                        VStack(alignment: .leading) {
                            Text("\(course.description)").font(.system(size: 15))
                        }.padding(.top, 6)
                        .padding(.horizontal, 12)
                        .padding(.bottom, 16)
                    }
                }
            }.navigationTitle("Accident Type")
        }
    }
}
