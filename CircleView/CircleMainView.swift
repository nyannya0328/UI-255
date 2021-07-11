//
//  CircleMainView.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/08.
//

import SwiftUI
extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
  

    
    
}

struct CircleMainView: View {
    @State var showView = false
   
    @State var maxCicleheight : CGFloat = 0
    var body: some View {
        VStack{
            
            
            GeometryReader{proxy -> AnyView in
                
                
                let height = proxy.frame(in: .global).height
                
                
                
                DispatchQueue.main.async {
                    
                    if maxCicleheight == 0 {
                        
                        
                        self.maxCicleheight = height
                        
                    }
                    
                }
                
                return AnyView(
                
                    ZStack{
                        
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: getRect().width / 2, y: -height / 1.3)
                            
                    
                    Circle()
                        .fill(Color("dark"))
                        .offset(x:  -getRect().width / 2, y: -height / 1.5)
                    
                    Circle()
                        .fill(Color("lb"))
                        .offset(y: -height / 1.3)
                        .rotationEffect(.init(degrees: -5))
                    
                            
                    }
                
                )
             
                
                
                
            }
            .frame(maxHeight: getRect().width)
            
            ZStack{
                
                
                if showView{
                    
                    SignUp()
                        .transition(.move(edge: .trailing))
                }
                else{
                    
                    Login()
                        .transition(.move(edge: .trailing))
                }
                
            }
           
            .padding(.top, -maxCicleheight / 1.6)
            .frame(maxHeight: .infinity, alignment: .top)
            .overlay(
            
                ZStack{
                
                
                
                HStack{
                    
                    
                    
                    Text(showView ? "NewMember" : "Already Account?")
                        .foregroundColor(.gray)
                    
                    Button {
                        
                        withAnimation{
                            
                            showView.toggle()
                        }
                        
                    } label: {
                        Text("Sign in")
                            .font(.title2.monospacedDigit())
                            .foregroundColor(.orange)
                    }
                    

                    
                    
                }
              
                
                
               
                
                
                
                
                
            }
                
                ,alignment: .bottom
            
            )
            .background(
            
                
                HStack{
                    
                    
                    
                    Circle()
                        .fill(Color("lb"))
                        .frame(width: 70, height: 70)
                        .offset(x: -30 , y: 30)
                    
                    
                    Spacer()
                    
                    Circle()
                        .fill(Color("dark"))
                        .frame(width: 150, height: 150)
                        .offset(x: 40, y: 40)
                    
                    
                    
                }
                    
                    .ignoresSafeArea(.keyboard, edges: .bottom)
                   
                
                ,alignment: .bottom
            
            )
            
        }
    }
}

struct CircleMainView_Previews: PreviewProvider {
    static var previews: some View {
        CircleMainView()
    }
}
