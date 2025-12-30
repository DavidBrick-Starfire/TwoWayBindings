//
//  ContentView.swift
//  TwoWayBindings
//
//  Created by David Brick on 12/29/25.
//

import SwiftUI

struct ContentView: View {
    @State private var pressCount = 0
    @State private var toggleIsOn = true
    @State private var name = ""
    @State private var selectedColor: Color = .red
    @State private var selectedDate: Date = Date()
    @State private var stepperValue = 0
    @State private var sliderValue = 50.0
    var body: some View {
        VStack {
            Spacer()
            Text("Press count: \(pressCount)")
                .frame(width: 150.0, height: 40.0  )
            Button("Press Me") {
                pressCount += 1
            }
            .buttonStyle(.bordered)
            .background(.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10.0)
            Spacer()
            
            TextField("Enter a name:", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Name entered: \(name)")
            
            Spacer()
            Toggle("Toggle is \(toggleIsOn ? "on" : "off")", isOn: $toggleIsOn)
            
            Rectangle()
                .fill(selectedColor)
                .frame(width: 100.0, height: 100.0)
            ColorPicker("Pick a rectangle color:",selection: $selectedColor)
            Spacer()
            DatePicker("Date:", selection: $selectedDate)
            Text("Selected date is: \(selectedDate.formatted(date:.abbreviated, time:.shortened))")
            Spacer()
            Stepper("Stepper value: \(stepperValue)", value: $stepperValue, in:  1...10   )
            Spacer()
  //          Slider(value: $sliderValue, in: 0...100)
            Slider(value: $sliderValue, in: 0...100) {
                // Accessibility label
            } minimumValueLabel: {
                Image(systemName: "speaker.minus")
            } maximumValueLabel: {
                Image(systemName: "speaker.plus")
            }

 //           Slider(value: $sliderValue, in: 0...100,{
   //                //Accessability label
     //              minimumValueLabel: Text("0")
       //     }
            Text("Slider value: \(Int(sliderValue))%")
            Spacer()
        }
        .font(.title2)
        .padding()
    }
}

#Preview {
    ContentView()
}
