//
//  AppError.swift
//  AstronomyPhotos
//
//  Created by Brendon Crowe on 1/16/23.
//

import Foundation


enum AppError: Error {
  case badURL(String) 
  case noResponse
  case networkClientError(Error)
  case noData
  case decodingError(Error)
  case badStatusCode(Int)
  case badMimeType(String)
}
