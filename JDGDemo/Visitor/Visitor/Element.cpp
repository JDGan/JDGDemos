//
//  Element.cpp
//  Visitor
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Element.cpp
#include "Element.h" 
#include "Visitor.h"
#include <iostream> 

using namespace std;
Element::Element()
{
    
}

Element::~Element()
{
    
}

void Element::Accept(Visitor* vis)
{
    
}

ConcreteElementA::ConcreteElementA()
{
    
}

ConcreteElementA::~ConcreteElementA()
{
    
}

void ConcreteElementA::Accept(Visitor* vis)
{
    vis->VisitConcreteElementA(this);
    cout<<"visiting ConcreteElementA..."<<endl;
}

ConcreteElementB::ConcreteElementB()
{
    
}

ConcreteElementB::~ConcreteElementB()
{
    
}

void ConcreteElementB::Accept(Visitor* vis)
{
    cout<<"visiting ConcreteElementB..."<<endl;
    vis->VisitConcreteElementB(this);
}