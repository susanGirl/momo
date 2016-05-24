//
//  UIView+XMGExtension.m
//  GD_GoodMom
//
//  Created by lanou3g on 16/5/23.
//  Copyright © 2016年 温哲. All rights reserved.
//

#import "UIView+XMGExtension.h"

@implementation UIView (XMGExtension)
- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    

}



- (void)setWidth:(CGFloat)width{

    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height{

    CGRect frame  = self.frame;
    frame.size.height = height;
    self.frame = frame;

}

- (void)setX:(CGFloat)x{

    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;

}

- (void)setY:(CGFloat)y{

    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;

}


- (CGFloat)width{
    return self.frame.size.width;
}

- (CGFloat)height{
    return self.frame.size.height;
}
- (CGFloat)x{
    return self.frame.origin.x;
}
- (CGFloat)y{
    return self.frame.origin.y;
}



@end
