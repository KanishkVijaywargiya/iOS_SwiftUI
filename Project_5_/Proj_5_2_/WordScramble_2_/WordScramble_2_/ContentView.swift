//
//  ContentView.swift
//  WordScramble_2_
//
//  Created by kanishk vijaywargiya on 06/03/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var useWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding(.horizontal)
                
                List(useWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                Text("Your score: \(useWords.count * rootWord.count)")
            }
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError){
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            .navigationBarTitle(rootWord)
            .navigationBarItems(trailing: Button(action: startGame){
                Text("Start New Game")
            })
        }
    }
    
    func addNewWord() {
        // lowercase & trim
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if remaining string is empty.
        guard answer.count > 0 else {
            newWord = ""
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "Tha is not a real word")
            return
        }
        
        // extra validation to come
        useWords.insert(answer, at: 0)
        newWord = ""
    }
    
    func startGame() {
        useWords = [String]()
        newWord = ""
        rootWord = ""
        //find url of start.txt
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordURL){
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "Word Scramble Game"
                
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }
    
    func isOriginal(word: String) -> Bool {
        !useWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else {
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        guard word.count > 2 else {
            return false
        }
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
