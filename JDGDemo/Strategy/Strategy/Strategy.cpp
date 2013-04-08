//
//  Strategy.cpp
//  Strategy
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Strategy.cpp
#include "Strategy.h" 
#include <iostream>
using namespace std;

Strategy::Strategy()
{
    
}

Strategy::~Strategy()
{
    cout<<"~Strategy....."<<endl;
}

void Strategy::AlgrithmInterface()
{
    
}

ConcreteStrategyA::ConcreteStrategyA()
{
    
}

ConcreteStrategyA::~ConcreteStrategyA()
{
    cout<<"~ConcreteStrategyA....."<<endl;
}

void ConcreteStrategyA::AlgrithmInterface()
{
    cout<<"test ConcreteStrategyA....."<<endl;
}

ConcreteStrategyB::ConcreteStrategyB()
{

}

ConcreteStrategyB::~ConcreteStrategyB()
{
    cout<<"~ConcreteStrategyB....."<<endl;
}

void ConcreteStrategyB::AlgrithmInterface()
{
    cout<<"test ConcreteStrategyB....."<<endl;
}
