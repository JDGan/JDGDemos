//
//  AbstractionImp.h
//  Bridge
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//AbstractionImp.h
#ifndef _ABSTRACTIONIMP_H_
#define _ABSTRACTIONIMP_H_

class AbstractionImp {
public:
    virtual ~AbstractionImp();
    virtual void Operation() = 0;
protected:
    AbstractionImp();
private:
};

class ConcreteAbstractionImpA : public AbstractionImp {
public:
    ConcreteAbstractionImpA();
    ~ConcreteAbstractionImpA();
    virtual void Operation();
protected:
private:
};

class ConcreteAbstractionImpB : public AbstractionImp {
public:
    ConcreteAbstractionImpB();
    ~ConcreteAbstractionImpB();
    virtual void Operation();
protected:
private:
};

#endif //~_ABSTRACTIONIMP_H_