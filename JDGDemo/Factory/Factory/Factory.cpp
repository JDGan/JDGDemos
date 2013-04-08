//
//  Factory.cpp
//  Factory
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Factory.cpp
#include "Factory.h"

#include "Product.h"
#include <iostream>
Factory::Factory()
{
    
}

Factory::~Factory()
{
    
}

ConcreteFactory::ConcreteFactory()
{
    cout<<"ConcreteFactory....."<<endl;
}

ConcreteFactory::~ConcreteFactory()
{
    
}

Product* ConcreteFactory::CreateProduct()
{
    return new ConcreteProduct();
}