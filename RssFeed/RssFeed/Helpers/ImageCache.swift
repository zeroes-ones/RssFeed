//
//  ImageCache.swift
//  RssFeed
//
//  Created by S on 10/17/20.
//  Copyright © 2020 Sandeep. All rights reserved.
//

import Foundation
import UIKit

@objc public class ImageCache: NSObject {
    private static var cacheTime: Double = 604800

    @objc public class func resetCache() {
        do {
            try FileManager.default.removeItem(atPath: ImageCache.cacheDirectory())
        } catch {
        }
    }

    private class func cacheDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        var cacheDirectory = paths[0]
        cacheDirectory = (cacheDirectory as NSString).appendingPathComponent("ImageCaches")
        return cacheDirectory
    }

    @objc public class func objectForKey(key: String) -> NSData? {
        let fileManager = FileManager.default
        let fileName = (ImageCache.cacheDirectory() as NSString).appendingPathComponent(key)

        guard fileManager.fileExists(atPath: fileName) else {
            return nil
        }

        let modificationDate = ((try? fileManager.attributesOfItem(atPath: fileName)) as NSDictionary?)?.object(forKey: FileAttributeKey.modificationDate) as?  NSDate
        if modificationDate?.timeIntervalSinceNow ?? 0 > cacheTime {
            do {
                try fileManager.removeItem(atPath: fileName)
            } catch {
            }
            return nil
        }

        let data = NSData(contentsOfFile: fileName)
        return data
    }

    @objc public class func setObject(data: NSData, forKey key:String) {
        let fileManager = FileManager.default
        let fileName = (ImageCache.cacheDirectory() as NSString).appendingPathComponent(key)

        var isDir: ObjCBool = true
        if !fileManager.fileExists(atPath: ImageCache.cacheDirectory(), isDirectory: &isDir) {
            do {
                try fileManager.createDirectory(atPath: ImageCache.cacheDirectory(), withIntermediateDirectories: false, attributes: nil)
            } catch {
            }
        }

        data.write(toFile: fileName, atomically: true)
    }
}
