//
//  Aggregate.h
//  Iterator
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Aggregate.h
#ifndef _AGGREGATE_H_
#define _AGGREGATE_H_
class Iterator;
typedef int Object;
class Interator;
class Aggregate {
public:
    virtual ~Aggregate();
    virtual Iterator* CreateIterator() = 0;
    virtual Object GetItem(int idx) = 0;
    virtual int GetSize() = 0;
protected:
    Aggregate();
   
private:
};

class ConcreteAggregate:public Aggregate
{
public:
    enum {SIZE = 3};
    ConcreteAggregate();
    ~ConcreteAggregate();
    Iterator* CreateIterator();
    Object GetItem(int idx);
    int GetSize();
protected:
private:
    Object _objs[SIZE];
};

#endif //~_AGGREGATE_H_