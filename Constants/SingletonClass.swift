//
//  SingletonClass.swift
//  covidTracker



import Foundation
class UrlPathSingleTon {
    static let urlsingleton = UrlPathSingleTon()
    private init() {}
    let urlpath = "https://api.covid19api.com/summary"
    func shared() -> String {
      return urlpath
    }
}
