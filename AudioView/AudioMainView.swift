//
//  AudioMainView.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/08.
//

import SwiftUI

var gra = LinearGradient(colors: [

    Color.blue.opacity(0.3),
    Color.red.opacity(0.3),
    Color.green.opacity(0.3),

], startPoint: .leading, endPoint: .trailing)


func graclor()->[Color]{
    
    
    
    let Audiocolos = [
        
        
        Color.yellow.opacity(0.3),
        Color.purple.opacity(0.3),
        Color.orange.opacity(0.3),

    ]
    return Audiocolos
}



var gra2 = LinearGradient(colors: graclor(), startPoint: .leading, endPoint: .trailing)
struct AudioMainView: View {
    
    @Namespace var animation
    
    @State var selectedTab = "house.fill"
    
    init(){

        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing:0){
            
            TabView(selection:$selectedTab){
                
                CircleMainView()
                    .tag("house.fill")
                
                Home()
                    .tag("gear")
                
               ReelView()
                    .tag("reels")
                
        ProView()
                
                    .tag("suit.heart.fill")
                
               Flow()
                    .tag("person.3.fill")
            }
            
            
            HStack(spacing:0){
                
                
                ForEach(["house.fill","gear","reels","suit.heart.fill","person.3.fill"],id:\.self){name in
                    
                    TABBUTTON(image: name, isSelectedimage: name != "reels", selected: $selectedTab, animation: animation)
                    
                    
                }
                
                
            }
            .padding(.vertical,10)
            .padding(.horizontal)
            .background(selectedTab == "reels" ? gra2 : gra)
            .overlay(Divider().background(.red),alignment: .top)
            
            
            
        }
    }
}

struct AudioMainView_Previews: PreviewProvider {
    static var previews: some View {
        AudioMainView()
    }
}


struct TABBUTTON : View{
    
    var image : String
    var isSelectedimage : Bool
    @Binding var selected : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button {
            
            withAnimation(.spring()){
                
                
                selected = image
            }
            
        } label: {
            
            
            
            
            
            ZStack{
                
                        
             
                    
                    
                    if isSelectedimage{
                        
                        
                        Image(systemName: image)
                            .font(.title3.italic())
                          
                        
                    }
                    
                    else{
                        
                        
                    Image(image)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            
                        
                    }
          
                
                
            }
            .background(
            
            
                ZStack{
                
                if selected == image{
                
        
                    RoundedRectangle(cornerRadius: 5)
                        
                        .stroke(Color.green,lineWidth: 4)
                        .matchedGeometryEffect(id: "BACK", in: animation)
                        .frame(width: 40, height: 35)
                        .shadow(radius: 9)
                    
                  
            }
                
            }
                    
                
            
            )
            .foregroundColor(selected == image ? selected == "reels" ? .purple : .black : .gray)
            .frame(maxWidth: .infinity)
            
        }

        
        
        
    }
    
}
