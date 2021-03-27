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
        .init(name: "Fire", imageName: "fire", numLessons: 35, totalTime: 10.35, description:"This is Fire AccidentThis is Fire AccidentThis is Fire AccidentThis is Fire AccidentThis is Fire AccidentThis is Fire AccidentThis is Fire AccidentThis is Fire AccidentThis is Fire AccidentThis is Fire Accident", dangerousRate: 5),
        .init(name: "Water", imageName: "water", numLessons: 50, totalTime: 20.5, description:"This is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water AccidentThis is Water Accident",dangerousRate: 3),
        .init(name: "Electronic", imageName: "electronic", numLessons: 44, totalTime: 16.3, description:"This is Electronic AccidentThis is Electronic AccidentThis is Electronic AccidentThis is Electronic AccidentThis is Electronic AccidentThis is Electronic AccidentThis is Electronic AccidentThis is Electronic AccidentThis is Electronic AccidentThis is Electronic AccidentThis is Electronic Accident",dangerousRate: 4)
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
//                            .scaledToFill()
                            
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
