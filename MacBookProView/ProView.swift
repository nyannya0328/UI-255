//
//  ProView.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/07.
//

import SwiftUI

struct ProView: View {
    var body: some View {
        
        
        
  
            
                
            
                    
                
                   
            ZStack{
                
                Screen()
                    .frame(width: 1265, height: 695)
                
                BottomView()
                    .frame(width: 1200, height: 1000)
                
            }
            .scaleEffect(0.2)
                 
                   
                    
                   
                
                
                
      
      
    }
}

struct ProView_Previews: PreviewProvider {
    static var previews: some View {
        ProView()
    }
}

struct Screen : View{
    
    var body: some View{
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 30)
            
            
            RoundedRectangle(cornerRadius: 30)
                .strokeBorder(Color("Gray"),lineWidth: 3)
            
            
            VStack(spacing:0){
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 1200, height: 590)
                    .cornerRadius(0)
                    .padding(.top,40)
                    .padding(.bottom,20)
                
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.white.opacity(0.3))
                    .overlay(
                    Text("Nyan nyan")
                        .font(.title.italic())
                        .foregroundColor(.white)
                        .offset(y: -3)
                    
                    )
                
                
                
            }
            
            
            HStack(spacing:10){
                
                
                ZStack{
                    
                    Color.gray
                        .clipShape(Circle())
                        .frame(width: 10, height: 10)
                    
                    
                    Color.black
                        .clipShape(Circle())
                        .frame(width: 5, height: 5)
                }
                
                Color.green
                    .clipShape(Circle())
                    .frame(width: 10, height: 10)
                
                
                
                
                
            }
            .offset(y: 10)
            .frame(maxHeight: .infinity, alignment: .top)
            
            
            
            
            
            
            
        }
    }
}

struct BottomView : View{
    
    var body: some View{
        
        
        ZStack{
            
            ZStack{
                
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(Color("Gray2"))
                
                
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(
                    
                    
                        LinearGradient(colors: getGra(), startPoint: .leading, endPoint: .trailing)
                    
                    )
                    .frame(width: 180)
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(
                    
                    
                        LinearGradient(colors: getGra().reversed(), startPoint: .leading, endPoint: .trailing)
                    
                    )
                    .frame(width: 180)
                    .frame(maxWidth: .infinity,alignment: .trailing)
                
                
                
                
            }
            .frame(height: 30)
            .scaleEffect(0.7)
            
            
            CustomCorner(radi: 20, corner: [.bottomLeft,.bottomRight])
                .fill(Color("Gray1").opacity(0.5))
                .frame(height: 50)
                .overlay(
                    CustomCorner(radi: 20, corner: [.bottomLeft,.bottomRight])
                        .fill(
                        
                        
                            LinearGradient(gradient: .init(colors: [
                            
                                Color("Gray1").opacity(1),
                                Color("Gray1").opacity(0.4),
                                Color.black.opacity(0.2),
                                Color.black.opacity(0.6)
                            
                            
                            
                            ]), startPoint: .top, endPoint: .bottom)
                        
                        )
                    
                    
                
                
                )
                .overlay(
                
                
                    CustomCorner(radi: 20, corner: [.bottomLeft,.bottomRight])
                        .fill(
                        
                        
                            LinearGradient(gradient: .init(colors: [
                            
                                Color("Gray1").opacity(0.4),
                                Color("Gray1").opacity(0.4),
                                Color.red.opacity(0.3)
                            
                            
                            
                            ]), startPoint: .top, endPoint: .bottom)
                        
                        )
                    
                        .frame(height: 80)
                        .rotation3DEffect(.init(degrees: 60), axis: (x: 1, y: 0, z: 0), anchor: .center, anchorZ: 0, perspective: 3)
                        .shadow(radius: 2)
                        .scaleEffect(1.05)
                        .offset(y: 50)
                
                )
               .scaleEffect(0.675)
               .rotation3DEffect(.init(degrees: -70), axis: (x: 3, y: 0, z: 0), anchor: .center, anchorZ:1 , perspective: 3)
                .offset(y: 15)
        
        }
        .frame(width: 1200, height: 1000)
        .drawingGroup()
        .scaleEffect(1.75)
        .overlay(
        
            ZStack{
            
            RoundedRectangle(cornerRadius: 100)
                .fill(.gray.opacity(0.4))
            
            
            let clearClor = Array(repeating: Color.clear, count: 15)
            
            
            let colos : [Color] = [
                
                Color.black.opacity(0.55),
                
                Color.black.opacity(0.25),
                
                Color.black.opacity(0.05)
            
            
            
            ]
            
            
            let combo = colos + clearClor + colos.reversed()
            
            
            RoundedRectangle(cornerRadius: 100)
                .fill(
                
                    LinearGradient(colors: combo, startPoint: .leading, endPoint: .trailing)
                
                )
            
            
            RoundedRectangle(cornerRadius: 100)
                .fill(.black.opacity(0.1))
            
            
            
        }
            
                .frame(width: 220, height: 35)
              
                .offset(y: -8)
                .clipped()
                .offset(y: -2)
        
        
        )
        .offset(y: 350)
    
    }
    
    func getGra()->[Color]{
        
        
        
        
        let colos = [
            
            Color("Gray2"), Color("Gray1").opacity(0.1),Color("Gray1"), Color("Gray2"), Color("Gray2")
           
        
        
        ]
        
        return colos
    }
}


struct CustomCorner : Shape{
    
    let radi : CGFloat
    let corner : UIRectCorner
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
    
}

