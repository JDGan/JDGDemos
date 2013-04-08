//
//  Decorator.cpp
//  Decorator
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Decorator.cpp
#include "Decorator.h"
#include <iostream>

Component::Component()
{
    
}

Component::~Component()
{
    
}

void Component::Operation()
{
    
}

ConcreteComponent::ConcreteComponent()
{
    
}

ConcreteComponent::~ConcreteComponent()
{
    
}

void ConcreteComponent::Operation()
{
    std::cout<<"ConcreteComponent operation..."<<std::endl;
}

Decorator::Decorator(Component* com)
{
    this->_com = com;
}

Decorator::~Decorator()
{
    delete _com;
}

void Decorator::Operation()
{
    
}

ConcreteDecorator::ConcreteDecorator(Component*com):Decorator(com)
{
    
}

ConcreteDecorator::~ConcreteDecorator()
{
    
}

void ConcreteDecorator::AddedBehavior()
{
    std::cout<<"ConcreteDecorator::AddedBehacior...."<<std::endl;
}

void ConcreteDecorator::Operation()
{
    _com->Operation();
    this->AddedBehavior();
}