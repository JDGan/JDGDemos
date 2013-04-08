//
//  Iterator.h
//  Iterator
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Iterator.h
#ifndef _ITERATOR_H_
#define _ITERATOR_H_

#include <iostream>
using namespace std;

class Aggregate;
typedef int Object;

class Iterator {
public:
    virtual ~Iterator();
    virtual void First() = 0;
    virtual void Next() = 0;
    virtual bool IsDone() =0;
    virtual Object CurrentItem() = 0;
protected:
    Iterator();
private:
};

class ConcreteIterator:public Iterator {
public:
    ConcreteIterator(Aggregate* ag , int idx = 0);
    ~ConcreteIterator();
    void First();
    void Next();
    bool IsDone();
    Object CurrentItem();
protected:
private:
    Aggregate* _ag;
    int _idx;
};

#endif //~_ITERATOR_H_