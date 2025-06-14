//
//  TagModel.swift
//  KartStopper
//
//  Created by Ashish Brahma on 08/05/25.
//
import SwiftUI
import SwiftData

@Model final class TagModel {
    @Attribute(.unique) var id = UUID()
    var name: String
    var colorData: Data?
    
    init(id: UUID = UUID(), name: String, color: UIColor) {
        self.id = id
        self.name = name
        
        do {
            try self.colorData = NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
        } catch {
            print(error)
        }
    }
    
    var color: Color {
        if let data = colorData {
            do {
                return try Color(NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)!)
            } catch {
                print(error)
            }
        }
        
        return Color.clear
    }
}
