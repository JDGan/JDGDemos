//
//  FlyweightFactory.h
//  Flyweight
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//FlyweightFactory.h
#ifndef _FLYWEIGHTFACTORY_H_
#define _FLYWEIGHTFACTORY_H_
#include "Flyweight.h"
#include <string>
#include <vector> 
using namespace std;

class FlyweightFactory
{
public:
    FlyweightFactory();
    ~FlyweightFactory();
    Flyweight* GetFlyweight(const string& key);
protected:
private:
    vector<Flyweight*> _fly;
};

#endif //~_FLYWEIGHTFACTORY_H_