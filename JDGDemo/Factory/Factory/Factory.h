//
//  Factory.h
//  Factory
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Factory.h
#ifndef _FACTORY_H_
#define _FACTORY_H_

using namespace std;

class Product;
class Factory
{
public:
    virtual ~Factory() = 0;
    virtual Product* CreateProduct() = 0;
protected:
    Factory();
private:
};
class ConcreteFactory:public Factory {
public:
    ~ConcreteFactory(); ConcreteFactory();
    Product* CreateProduct();
protected:
private:
};
#endif //~_FACTORY_H_
