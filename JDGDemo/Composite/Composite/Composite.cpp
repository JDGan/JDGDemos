//
//  Composite.cpp
//  Composite
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Composite.cpp
#include "Composite.h"
#include "Component.h"
#include <iostream>
using namespace std;
//#define NULL 0 //define NULL POINTOR
Composite::Composite()
{
    //vector<Component*>::iterator itend = comVec.begin();
}
    Composite::~Composite()
{
   
}

void Composite::Operation()
{
    vector<Component*>::iterator comIter = comVec.begin();
    for (;comIter != comVec.end();comIter++)
    {
            (*comIter)->Operation();
    }
}

void Composite::Add(Component* com)
{
    comVec.push_back(com);
}

void Composite::Remove(Component* com)
{
    cout<<"Remove is private"<<endl;
//    comVec.erase(&com);
}

Component* Composite::GetChild(int index)
{
    return comVec[index];
}
