//
//  ContentView.swift
//  Flag_game
//
//  Created by kanishk vijaywargiya on 24/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var userScore = 0
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [.blue, .black]),
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
            
            VStack(spacing:40){
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Spacer()
                
                VStack(spacing: 20){
                    Text("Your Score is: \(userScore)")
                        .foregroundColor(.white)
                    Text("Made in India")
                        .foregroundColor(.white)
                        .font(.caption)
                        .fontWeight(.black)
                }
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct! That’s the flag of \(countries[number])"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            if(userScore == 0){
                userScore = 0
            } else{
                userScore -= 1
            }
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
