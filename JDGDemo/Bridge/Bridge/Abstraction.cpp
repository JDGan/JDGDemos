//
//  Abstraction.cpp
//  Bridge
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Abstraction.cpp
#include "Abstraction.h" 
#include "AbstractionImp.h"
#include <iostream>
using namespace std;

Abstraction::Abstraction()
{
    
}

Abstraction::~Abstraction()
{
    
}

RefinedAbstraction::RefinedAbstraction(AbstractionImp* imp)
{
    _imp = imp;
}

RefinedAbstraction::~RefinedAbstraction()
{
    
}

void RefinedAbstraction::Operation()
{
    _imp->Operation();
}