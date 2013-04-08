//
//  Product.h
//  AbstactFactory
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Product.h
#ifndef _PRODUCT_H_
#define _PRODUCT_H_

class AbstractProductA
{
public:
    virtual ~AbstractProductA();
protected:
    AbstractProductA();
private:
};

class AbstractProductB {
public:
    virtual ~AbstractProductB();
protected:
    AbstractProductB();
private:
};

class ProductA1:public AbstractProductA {
public:
    ProductA1();
    ~ProductA1();
protected:
private:
};

class ProductA2:public AbstractProductA {
public:
    ProductA2();
    ~ProductA2();
protected:
private:
};

class ProductB1:public AbstractProductB {
public:
    ProductB1();
    ~ProductB1();
protected:
private:
};

class ProductB2:public AbstractProductB {
public:
    ProductB2();
    ~ProductB2();
protected:
private:
};
#endif //~_PRODUCT_H_
