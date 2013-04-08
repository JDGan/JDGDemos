//
//  Product.h
//  Factory
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Product.h
#ifndef _PRODUCT_H_
#define _PRODUCT_H_

using namespace std;

class Product
{
public:
    virtual ~Product() =0;
protected:
    Product();
private:
};
class ConcreteProduct:public Product {
public:
    ~ConcreteProduct();
    ConcreteProduct();
protected:
private:
};
#endif //~_PRODUCT_H_
