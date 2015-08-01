//
//  TryCatchFinally.swift
//  TableView
//
//  Created by user on 2015/8/1.
//  Copyright (c) 2015年 Rex Liu. All rights reserved.
//
import Foundation

func try(try:()->())->TryCatchFinally {
    return TryCatchFinally(try)
}
class TryCatchFinally {
    let tryFunc : ()->()
    var catchFunc = { (e:NSException!)->() in return }
    var finallyFunc : ()->() = {}
    
    init(_ try:()->()) {
        tryFunc = try
    }
    
    func catch(catch:(NSException)->())->TryCatchFinally {
        // objc bridging needs NSException!, not NSException as we'd like to expose to clients.
        catchFunc = { (e:NSException!) in catch(e) }
        return self
    }
    
    func finally(finally:()->()) {
        finallyFunc = finally
    }
    
    deinit {
        tryCatchFinally(tryFunc, catchFunc, finallyFunc)
    }
}
