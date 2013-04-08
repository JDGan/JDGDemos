//
//  Facade.h
//  Facade
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Facade.h
#ifndef _FACADE_H_
#define _FACADE_H_
class Subsystem1
{
public:
    Subsystem1();
    ~Subsystem1();
    void Operation();
protected:
private:
};

class Subsystem2
{
public:
    Subsystem2();
    ~Subsystem2();
    void Operation();
protected:
private:
};

class Facade {
public:
    Facade();
    ~Facade();
    void OperationWrapper();
protected:
private:
    Subsystem1* _subs1;
    Subsystem2* _subs2;
};
#endif //~_FACADE_H_