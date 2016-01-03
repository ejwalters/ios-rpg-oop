//
//  Character.swift
//  rpg2-oop-exercise
//
//  Created by Eric Walters on 1/2/16.
//  Copyright © 2016 Eric Walters. All rights reserved.
//

import Foundation


class Character {
    
    private var _hp: Int = 100
    private var _attackPower: Int = 20
    private var _name: String = "Player"
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    init(startingHp: Int, attackPower: Int, name: String) {
        self._hp = startingHp
        self._attackPower = attackPower
        self._name = name
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        
        return true
    }
}