//
//  ContentView.swift
//  unitConversion
//
//  Created by Kamil Wójcicki on 28/02/2023.
//
//build an app that handles unit conversions: users will select an input unit and an output unit, then enter a value, and see the output of the conversion.
//Length conversion: users choose meters, kilometers, feet, yards, or miles.
import SwiftUI

struct ContentView: View {
    @State private var length: Double = 0
    @State private var inputUnit = "milimeters"
    @State private var outputUnit = "milimeters"
    
    @FocusState private var unitIsFocused: Bool
    let units = ["milimeters", "centimeters", "meters", "kilometers", "feet", "yards", "miles"]
    
//    private var formatDouble: FormatStyle{
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .decimal
//        formatter.maximumFractionDigits = 2
//        return formatter
//    }
    
    private var conversion: Double{
        var output: Double
            if inputUnit == "milimeters"{
                return length
            }else if inputUnit == "centimeters"{
                output = length * 10
                return output
            }else if inputUnit == "meters"{
                output = length * 1000
                return output
            }else if inputUnit == "kilometers"{
                output = length * 1000000
                return output
            }else if inputUnit == "feet"{
                output = length * 304.8
                return output
            }else if inputUnit == "yards"{
                output = length * 914.4
                return output
            }else{
                output = length * 1609344
                return output
            }
        }
    
    func output(conversion: Double) -> Double{
        var result: Double
        if outputUnit == "milimeters"{
            return conversion
        }else if outputUnit == "centimeters"{
            result = conversion / 10
            return result
        }else if outputUnit == "meters"{
            result = conversion / 1000
            return result
        }else if outputUnit == "kilometers"{
            result = conversion / 1000000
            return result
        }else if outputUnit == "feet"{
            result = conversion / 304.8
            return result
        }else if outputUnit == "yards"{
            result = conversion / 914.4
            return result
        }else{
            result = conversion / 1609344
            return result
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Length", value: $length, format: .number)
                        .keyboardType(.decimalPad)
                }header: {
                    Text("Enter length you want to convert")
                }
                Section{
                    Picker("Unit input:", selection: $inputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                }header: {
                    Text("Select unit input")
                }
                
                Section{
                    Picker("Unit output:", selection: $outputUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                }header: {
                    Text("Select unit output")
                }
                
                Section{
                    Text(output(conversion:conversion), format: .number)
                }header: {
                    Text("Conversion length")
                }
            }
            .navigationTitle("Unit conversion")
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
