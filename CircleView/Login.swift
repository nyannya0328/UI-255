//
//  Login.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/08.
//

import SwiftUI

struct Login: View {
    @State var TF = ""
    @State var pass = ""
    var body: some View {
        VStack{
            
            Text("Sing In")
                .font(.title.bold())
                .foregroundColor(Color("lb"))
                .kerning(1.5)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("User Name")
                    .font(.footnote.italic())
                    
                TextField("Enter", text: $TF)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("dark"))
                
                   
                
                Divider()
                    .background(Color.primary)
            
                
                
            }
            .padding(.top,5)
         
                
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Password")
                    .font(.footnote.italic())
                    
                SecureField("12345", text: $pass)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(Color("dark"))
                
                   
                
                Divider()
                    .background(Color.primary)
                    .padding(.bottom)
            
                
                
            }
            .padding(.top,20)
         
            
            
            Button("Forgot Passward?"){
                
                
                
            }
            .padding(.top,10)
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            
            Button {
                
            } label: {
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color("dark"),in: Circle())
                    .shadow(radius: 5)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
           


            
            
        }
        .padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
