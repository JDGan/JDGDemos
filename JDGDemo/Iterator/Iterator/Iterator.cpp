//
//  Iterator.cpp
//  Iterator
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Iterator.cpp
#include "Iterator.h"
#include "Aggregate.h" 


Iterator::Iterator()
{
    
}

Iterator::~Iterator()
{
    
}

ConcreteIterator::ConcreteIterator(Aggregate* ag , int idx)
{
    this->_ag = ag;
    this->_idx = idx;
}

ConcreteIterator::~ConcreteIterator()
{
    
}

Object ConcreteIterator::CurrentItem()
{
    return _ag->GetItem(_idx);
}

void ConcreteIterator::First()
{
    _idx = 0;
}

void ConcreteIterator::Next()
{
    if (_idx < _ag->GetSize()) _idx++;
}

bool ConcreteIterator::IsDone()
{
    return (_idx == _ag->GetSize());
}
