//
//  Prototype.cpp
//  Prototype
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Prototype.cpp
#include "Prototype.h" 
#include <iostream> 
using namespace std;

Prototype::Prototype()
{
    
}

Prototype::~Prototype()
{
    
}

Prototype* Prototype::Clone() const
{
    return 0;
}

ConcretePrototype::ConcretePrototype()
{
    
}

ConcretePrototype::~ConcretePrototype()
{
    
}

ConcretePrototype::ConcretePrototype(const ConcretePrototype& cp)
{
    cout<<"ConcretePrototype copy ..."<<endl;
}

Prototype* ConcretePrototype::Clone() const
{
    return new ConcretePrototype(*this);
}
