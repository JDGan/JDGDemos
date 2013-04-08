//
//  Builder.h
//  Builder
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Builder .h
#ifndef _BUILDER_H_
#define _BUILDER_H_
#include <string> 
using namespace std;

class Product;
class Builder {
public:
    virtual ~Builder();
    virtual void BuildPartA(const string& buildPara) = 0;
    virtual void BuildPartB(const string& buildPara) = 0;
    virtual void BuildPartC(const string& buildPara) = 0;
    virtual Product* GetProduct() = 0;
protected:
    Builder();
private:
};

class ConcreteBuilder:public Builder {
public:
    ConcreteBuilder();
    ~ConcreteBuilder();
    void BuildPartA(const string& buildPara);
    void BuildPartB(const string& buildPara);
    void BuildPartC(const string& buildPara);
    Product* GetProduct();
protected:
private:
};
#endif //~_BUILDER_H_
