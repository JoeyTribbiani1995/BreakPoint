//
//  DataService.swift
//  BreakPoint
//
//  Created by Joey Tribbiani on 4/9/18.
//  Copyright © 2018 Dũng Võ. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("childs")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE : DatabaseReference {
        return _REF_BASE
    }
    
    var REF_USERS : DatabaseReference {
        return _REF_USERS
    }
    
    var REF_REF_GROUPS : DatabaseReference {
        return _REF_GROUPS
    }
    
    var REF_FEED : DatabaseReference {
        return _REF_FEED
    }
    
    func createDBUser(uid : String , userData : Dictionary<String , Any>){
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
    func uploadPost(withMessage message : String , forUID uid : String , withGroupKey groupKey : String? ,complete : @escaping CompletionSend){
        if groupKey != nil {
            
        }else {
            REF_FEED.childByAutoId().updateChildValues(["content":message,"senderId":uid])
            complete(true)
        }
    }
    
    func getAllFeedMessages(completion : @escaping (_ message : [Message]) -> () ){
        var messages = [Message]()
        
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for mes in feedMessageSnapshot {
                let content = mes.childSnapshot(forPath: "content").value as! String
                let senderId = mes.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderId: senderId)
                messages.append(message)
            }
            
            completion(messages)
        }
    }
    
    func getUserName(forUID uid : String , completion : @escaping (_ username : String ) -> ()){
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for user in userSnapshot {
                if user.key == uid {
                    completion(user.childSnapshot(forPath: "email").value as! String)
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
