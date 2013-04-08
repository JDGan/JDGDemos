//
//  Singleton.h
//  Singleton
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Singleton.h
#ifndef _SINGLETON_H_
#define _SINGLETON_H_
#include <iostream> 
using namespace std;
class Singleton {
public:
    static Singleton* Instance();
protected:
    Singleton();
private:
    static Singleton* _instance;
};
#endif //~_SINGLETON_H_
