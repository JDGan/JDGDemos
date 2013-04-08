//
//  Visitor.h
//  Visitor
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Visitor .h
#ifndef _VISITOR_H_
#define _VISITOR_H_

class ConcreteElementA;
class ConcreteElementB;
class Element;

class Visitor {
public:
    virtual ~Visitor();
    virtual void VisitConcreteElementA(Element* elm) = 0;
    virtual void VisitConcreteElementB(Element* elm) = 0;
protected:
    Visitor();
private:
};

class ConcreteVisitorA:public Visitor {
public:
    ConcreteVisitorA();
    virtual ~ConcreteVisitorA();
    virtual void VisitConcreteElementA(Element* elm);
    virtual void VisitConcreteElementB(Element* elm);
protected:
private:
};

class ConcreteVisitorB:public Visitor {
public:
    ConcreteVisitorB();
    virtual ~ConcreteVisitorB();
    virtual void VisitConcreteElementA(Element* elm);
    virtual void VisitConcreteElementB(Element* elm);
protected:
private:
};
#endif //~_VISITOR_H_