//
//  Context.cpp
//  Strategy
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Client.c //Context.cpp
#include "Context.h"
#include "Strategy.h"
#include <iostream>
using namespace std;

Context::Context(Strategy* stg)
{
    _stg = stg;
}

Context::~Context()
{
    if (!_stg) delete _stg;
}

void Context::DoAction()
{
    _stg->AlgrithmInterface();
}