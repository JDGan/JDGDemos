//
//  Singleton.cpp
//  Singleton
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Singleton.cpp
#include "Singleton.h"
#include <iostream> 

using namespace std;

Singleton* Singleton::_instance = 0;

Singleton::Singleton()
{
    cout<<"Singleton...."<<endl;
}

Singleton* Singleton::Instance()
{
    if (_instance == 0)
    {
        _instance = new Singleton();
    }
    return _instance;
}
