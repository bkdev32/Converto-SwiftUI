//
//  CurrencyView.swift
//  Converto-SwiftUI
//
//  Created by Burhan Kaynak on 09/06/2021.
//

import SwiftUI

struct CurrencyView: View {
    var currency: DataModel
    
    var body: some View {
        HStack {
            Image(systemName: currency.currencyLabel)
                .font(.largeTitle)
            Spacer()
            Text(currency.rateString).padding(.trailing)
                .font(.title)
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
        .background(Color("boxColor").opacity(0.4))
        .foregroundColor(.white)
        .cornerRadius(40.0)
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView(currency: DataModel(rate: 0.00, currency: "USD"))
    }
}
