//
//  Handle.h
//  ChainOfResponsibility
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Handle.h
#ifndef _HANDLE_H_
#define _HANDLE_H_
class ChainHandle {
public:
    virtual ~ChainHandle();
    virtual void HandleRequest() = 0;
    void SetSuccessor(ChainHandle* succ);
    ChainHandle* GetSuccessor();
protected:
    ChainHandle();
    ChainHandle(ChainHandle* succ);
private:
    ChainHandle* _succ;
};

class ConcreteHandleA:public ChainHandle {
public:
    ConcreteHandleA();
    ~ConcreteHandleA();
    ConcreteHandleA(ChainHandle* succ);
    void HandleRequest();
   
protected:
private:
};

class ConcreteHandleB:public ChainHandle {
public:
    ConcreteHandleB();
    ~ConcreteHandleB();
    ConcreteHandleB(ChainHandle* succ);
    void HandleRequest();
protected:
private:
};

#endif //~_HANDLE_H_