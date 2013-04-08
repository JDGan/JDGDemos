//
//  Adapter.h
//  Adapter
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Adapter.h
#ifndef _ADAPTER_H_
#define _ADAPTER_H_

class Target{
public:
    Target();
    virtual ~Target();
    virtual void Request();
    
protected:
private:
};

class Adaptee {
public:
    Adaptee();
    ~Adaptee();
    void SpecificRequest();
    
protected:
private:
};

class ClassAdapter:public Target,private Adaptee {
public:
    ClassAdapter();
    ~ClassAdapter();
    void Request();
protected:
private:
};

class ObjectAdapter:public Target {
public:
    ObjectAdapter(Adaptee* ade);
    ~ObjectAdapter();
    void Request();
protected:
private:
    Adaptee* _ade;
};

#endif //~_ADAPTER_H_