//
//  Home.swift
//  UI-249
//
//  Created by nyannyan0328 on 2021/06/30.
//

import SwiftUI

var gra = LinearGradient(colors: [.red,.green,.blue], startPoint: .leading, endPoint: .trailing)
struct Home: View {
    @State var currentTab = "reels"
    @Namespace var animation
    
    init(){
        
        UITabBar.appearance().isHidden = true
        
    }
    var body: some View {
        
        
        VStack(spacing:0){
            
            TabView(selection:$currentTab){
                
                
            Text("A")
                    .tag("house.fill")
                
                
            Text("B")
                    .tag("gear")
                
                ReelView()
                    .tag("reels")
                
                
            Text("C")
                    .tag("suit.heart.filll")
                
                
                
                
            Text("profile")
                    .tag("person.3.fill")
                
            }
            
            HStack(spacing:0){
                
                
                ForEach(["house.fill","gear","reels","suit.heart.fill","person.3.fill"],id:\.self){image in
                    
                    TabButton(image: image, isSyetemimage: image !=  "reels", selected: $currentTab, animation: animation)
                    
                    
                    
                    
                }
            }
            
            .padding(.horizontal)
            .padding(.vertical,10)
            .overlay(Divider().background(.red),alignment: .top)
            .background(currentTab == "reels" ? .black : .white)
            
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct TabButton : View{
    
    
    var image : String
    var isSyetemimage : Bool
    @Binding var selected : String
    
    var animation : Namespace.ID
    
    
    var body: some View{
        
        
        Button {
            
            withAnimation{
                
                
                selected = image
                
            }
        } label: {
            
            ZStack{
                
                VStack{
                    
                    
                   
                    
                    
                    
                    if isSyetemimage{
                                   
                                   
                                   Image(systemName: image)
                                       .font(.title2)
                                   
                                   
                               }
                               
                               else{
                                   
                               Image(image)
                                       .resizable()
                                       .renderingMode(.template)
                                       .aspectRatio(contentMode: .fit)
                                       .frame(width: 25, height: 25)
                                   
                               }
                    
                    
                    if selected == image{
                        
                        
                        Capsule()
                            .fill(Color.green)
                            .frame(height: 3.5)
                            .padding(.top,5)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                    
                    else{
                        
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 3.5)
                            .padding(.top,5)
                        
                        
                    }
                    
                    
                }
                
                
                
            }
            .foregroundColor(selected == image ? selected == "reels" ? .white : .pink : .gray)
            .frame(maxWidth: .infinity)
            
            
        }

    }
}
