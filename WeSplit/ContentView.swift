//
//  ContentView.swift
//  WeSplit
//
//  Created by Dathan Wong on 5/21/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numPeople = ""
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalCost: Double{
        let tipPercent = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        return orderAmount*(1+(tipPercent/100))
    }
    var totalPerPerson: Double{
        let people = Double(numPeople) ?? 1
        let tipPercent = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let cost = orderAmount*(1+(tipPercent/100))/people
        return cost
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of People", text: $numPeople)
//                    Picker("Number of people", selection: $numPeople){
//                        ForEach(2 ..< 100){
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("Select a tip percentage")){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total Cost")) {
                    Text("$\(totalCost, specifier: "%.2f")")
                }
                Section(header: Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
