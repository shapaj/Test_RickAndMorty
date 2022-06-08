//
//  TagsLayout.swift
//  AndersenTeams
//
//  Created by anduser on 26.05.2022.
//

import UIKit

class TagsLayout: UICollectionViewFlowLayout {
    
    var maxLines: Int = 0
    
    required override init() {
        super.init()
        common()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        common()
    }
    
    private func common() {
        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        minimumLineSpacing = 10
        minimumInteritemSpacing = 10
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var lines: Int = 0
        var attrebutesResult: [UICollectionViewLayoutAttributes] = []
        guard let attrebutes = super.layoutAttributesForElements(in: rect ) else { return [] }
        var xPosition: CGFloat = sectionInset.left
        var yPosition: CGFloat = -1.0
        
        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        for attrebute in attrebutes {
            if attrebute.representedElementCategory != .cell { continue }
            
            if attrebute.frame.origin.y >= yPosition {
                if lines == maxLines {
                    if let last = attrebutes.last, let current = attrebutesResult.last {
                        if current.frame.maxX + minimumInteritemSpacing + last.frame.width > rect.width {
                            last.frame.origin.x = current.frame.origin.x
                            last.frame.origin.y = current.frame.origin.y
                            attrebutesResult.removeLast(1)
                        } else {
                            last.frame.origin.x = current.frame.maxX + minimumInteritemSpacing
                            last.frame.origin.y = current.frame.origin.y
                        }
//
//                        attrebutesResult.append(last)
//
                    }
                    break
                }
                lines += 1
                xPosition = sectionInset.left
            }
            
            attrebutesResult.append(attrebute)
            
            attrebute.frame.origin.x = xPosition
            xPosition += attrebute.frame.width + minimumInteritemSpacing
            yPosition = attrebute.frame.maxY
        }
        
        return attrebutesResult
    }
}

