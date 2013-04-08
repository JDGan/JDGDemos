//
//  Adapter.cpp
//  Adapter
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Adapter.cpp
#include "Adapter.h"
#include <iostream>

Target::Target()
{
    
}

Target::~Target()
{
    
}

void Target::Request()
{
    std::cout<<"Target::Request"<<std::endl;
}

Adaptee::Adaptee()
{
    
}
Adaptee::~Adaptee()
{
    
}

void Adaptee::SpecificRequest()
{
    std::cout<<"Adaptee::SpecificRequest"<<std::endl;
}

ClassAdapter::ClassAdapter()
{
    
}

ClassAdapter::~ClassAdapter()
{
    
}

void ClassAdapter::Request()
{
    this->SpecificRequest();
}

ObjectAdapter::ObjectAdapter(Adaptee* ade)
{
    this->_ade = ade;
}

ObjectAdapter::~ObjectAdapter()
{
    
}

void ObjectAdapter::Request()
{
    _ade->SpecificRequest();
}