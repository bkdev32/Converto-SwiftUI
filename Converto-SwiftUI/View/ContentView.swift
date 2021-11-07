//
//  ContentView.swift
//  Converto-SwiftUI
//
//  Created by Burhan Kaynak on 09/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCurrency = ""
    @State var currency: DataModel
    let viewModel = CurrencyModel()
    
    
    var body: some View {
        ZStack {
            Color("secondaryColor")
                .ignoresSafeArea()
            VStack {
                VStack {
                    Image("appLogo")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text("Converto")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("boxColor"))
                }.padding(.top)
                Spacer()
                HStack {
                    CurrencyView(currency: currency)
                }
                Spacer()
                Picker("", selection: $selectedCurrency){
                    ForEach(viewModel.currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }.onReceive([self.selectedCurrency].publisher.first(), perform: { value in
                    viewModel.fetchData(for: value) { (currency) in
                        self.currency = currency
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataModel = DataModel(rate: 0.0, currency: "")
    static var previews: some View {
        ContentView(currency: dataModel)
    }
}
