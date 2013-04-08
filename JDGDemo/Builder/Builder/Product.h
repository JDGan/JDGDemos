//
//  Product.h
//  Builder
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Product.h
#ifndef _PRODUCT_H_
#define _PRODUCT_H_
class Product {
public:
    Product();
    ~Product();
    void ProducePart();
protected:
private:
};

class ProductPart {
public:
    ProductPart();
    ~ProductPart();
    ProductPart* BuildPart();   
protected:
private:
};

#endif //~_PRODUCT_H_
