//
//  Director.cpp
//  Builder
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Director .cpp
#include "director.h"
#include "Builder.h"

Director::Director(Builder* bld)
{
    _bld = bld;
}

Director::~Director()
{
    
}

void Director::Construct()
{
    _bld->BuildPartA("user-defined");
    _bld->BuildPartB("user-defined");
    _bld->BuildPartC("user-defined");
}
