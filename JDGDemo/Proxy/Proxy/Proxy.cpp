//
//  Proxy.cpp
//  Proxy
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Proxy.cpp
#include "Proxy.h"
#include <iostream> 
using namespace std;

Subject::Subject()
{
    
}

Subject::~Subject()
{

}

ConcreteSubject::ConcreteSubject()
{
    
}

ConcreteSubject::~ConcreteSubject()
{
    
}

void ConcreteSubject::Request()
{
    cout<<"ConcreteSubject......request ...."<<endl;
}

Proxy::Proxy()
{

}

Proxy::Proxy(Subject* sub)
{
    _sub = sub;
}

Proxy::~Proxy()
{
    delete _sub;
}

void Proxy::Request()
{
    cout<<"Proxy request...."<<endl;
    _sub->Request();
}