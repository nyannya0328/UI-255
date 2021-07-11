//
//  Home.swift
//  UI-255
//
//  Created by nyannyan0328 on 2021/07/07.
//

import SwiftUI

struct Home: View {
    @State var selected = "Upcoming"
    @Namespace var animation
    @StateObject var model = HomeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:15){
                
                
                Text("Hi Guys")
                    .font(.largeTitle.italic())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.blue)
                
                
                HStack(alignment:.bottom){
                    
                    Text("Check your\n**Meeting Detalis**")
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Spacer()
                    
                    
                    Button {
                        
                        withAnimation{
                            
                            model.addNewMeting.toggle()
                        }
                        
                    } label: {
                        Text("Add")
                            .font(.caption.bold())
                            .foregroundColor(.black)
                            .padding(.horizontal,25)
                            .padding(.vertical,8)
                            .background(
                            Capsule()
                                .stroke(Color.black,lineWidth: 3)
                            
                            )
                            
                    }

                        
                    
                    
                }
                
                HStack(spacing:0){
                    
                    
                    ForEach(["Upcoming","OnHold","Post","Cancel"],id:\.self){index in
                        
                        
                        TabButton(title: index, selected: $selected, animation: animation)
                        
                        
                    }
                    
                }
                .padding(.top,20)
                
                Divider()
                
                
                
            }
            .padding()
            
            
            
            if model.metings.isEmpty{
                
                
                Image("notes")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                
                
                Text("Add**Meetings**")
                    .font(.title)
                    .padding(.top,20)
            }
            
            
            VStack(spacing:15){
                
                
                
                ForEach($model.metings){$meeting in
                    
                    
                    MeetingView(meetings: $meeting)
                    
                    
                }
                
                
                
                
            }
            .padding()
            
            
        }
        .background(Color("Bg"))
        .overlay(
            ZStack{
            
            if model.addNewMeting{
            
                AddNewMeeting()
                    .environmentObject(model)
            
            
        }
        }
        
        )
    }
    
   
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabButton : View{
    
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button {
            withAnimation{
                
                selected = title
            }
        } label: {
            VStack{
                
                Text(title)
                    .font(.callout)
                    .foregroundColor(selected == title ? .black : .gray)
                
                
                ZStack{
                    
                    
                    if selected == title{
                        
                        
                        Capsule()
                            .fill(Color.purple)
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    else{
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 3)
                        
                        
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
        }

    }
}
