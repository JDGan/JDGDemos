//
//  Handle.cpp
//  ChainOfResponsibility
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Handle.cpp
#include "Handle.h"
#include <iostream> 
using namespace std;
ChainHandle::ChainHandle()
{
    _succ = 0;
}

ChainHandle::~ChainHandle()
{
    delete _succ;
}

ChainHandle::ChainHandle(ChainHandle* succ)
{
    this->_succ = succ;
}

void ChainHandle::SetSuccessor(ChainHandle* succ)
{
    _succ = succ;
}

ChainHandle* ChainHandle::GetSuccessor()
{
    return _succ;
}

void ChainHandle::HandleRequest()
{
    
}

ConcreteHandleA::ConcreteHandleA()
{
    
}

ConcreteHandleA::ConcreteHandleA(ChainHandle* succ):ChainHandle(succ)
{
    
}

ConcreteHandleA::~ConcreteHandleA()
{
    
}

void ConcreteHandleA::HandleRequest()
{
    if (this->GetSuccessor() != 0)
    {
        cout<<"ConcreteHandleA 我把处理权给后继节点....."<<endl;
        this->GetSuccessor()->HandleRequest();
    }
    else
    {
        cout<<"ConcreteHandleA 没有后继了,我必须自己处理...."<<endl;
    }
}

ConcreteHandleB::ConcreteHandleB()
{
    
}

ConcreteHandleB::ConcreteHandleB(ChainHandle* succ):ChainHandle(succ)
{
    
}

ConcreteHandleB::~ConcreteHandleB()
{
    
}

void ConcreteHandleB::HandleRequest()
{
    if (this->GetSuccessor() != 0)
    {
        cout<<"ConcreteHandleB 我把处理权给后继节点....."<<endl;
        this->GetSuccessor()->HandleRequest();
    }
    else
    {
        cout<<"ConcreteHandleB 没有后继了,我必须自己处理...."<<endl;
    }
}
