import UIKit

let image = UIImage(named: "test")


public func fillImage(_ image: UIImage, withColor color: UIColor) -> UIImage {
  UIGraphicsBeginImageContextWithOptions(image.size, false, 0)
  defer { UIGraphicsEndImageContext() }
  
  guard let context = UIGraphicsGetCurrentContext() else { return image }

  context.translateBy(x: 0, y: image.size.height)
  context.scaleBy(x: 1.0, y: -1.0)
  context.setBlendMode(CGBlendMode.normal)

  let rect = CGRect(origin: .zero, size: image.size)
  guard let mask = image.cgImage else { return image }
  context.clip(to: rect, mask: mask)
  
  color.setFill()
  context.fill(rect)

  let newImage = UIGraphicsGetImageFromCurrentImageContext()!
  return newImage
}

let outImage = fillImage(image!, withColor: UIColor.red)


extension UIImage {
  public func withRoundedCorners(radius: CGFloat? = nil) -> UIImage? {
    let maxRadius = min(size.width, size.height) / 2
    let cornerRadius: CGFloat
    if let radius = radius, radius > 0 && radius <= maxRadius {
      cornerRadius = radius
    } else {
      cornerRadius = maxRadius
    }
    
    UIGraphicsBeginImageContextWithOptions(size, false, scale)
    
    let rect = CGRect(origin: .zero, size: size)
    UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
    
    UIColor.green.setFill()
    UIRectFill(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }
}

image?.withRoundedCorners()
