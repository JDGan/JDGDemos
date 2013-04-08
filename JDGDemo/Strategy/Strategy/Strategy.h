//
//  Strategy.h
//  Strategy
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//strategy.h
#ifndef _STRATEGY_H_
#define _STRATEGY_H_

class Strategy
{
public:
    Strategy();
    virtual ~Strategy();
    virtual void AlgrithmInterface() = 0;
    protected: private:
};

class ConcreteStrategyA:public Strategy
{
public:
    ConcreteStrategyA();
    virtual ~ConcreteStrategyA();
    void AlgrithmInterface();
    protected:
    private:
};

class ConcreteStrategyB:public Strategy {
public:
    ConcreteStrategyB();
    virtual ~ConcreteStrategyB();
    void AlgrithmInterface();
protected:
private:
};
#endif //~_STRATEGY_H_