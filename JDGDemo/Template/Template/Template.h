//
//  Template.h
//  Template
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Template.h
#ifndef _TEMPLATE_H_
#define _TEMPLATE_H_

class AbstractClass
{
public:
    virtual ~AbstractClass();
    void TemplateMethod();
protected:
    virtual void PrimitiveOperation1() = 0;
    virtual void PrimitiveOperation2() = 0;
    AbstractClass();
private:
};

class ConcreteClass1:public AbstractClass {
public:
    ConcreteClass1();
    ~ConcreteClass1();
protected:
    void PrimitiveOperation1();
    void PrimitiveOperation2();
private:
};

class ConcreteClass2:public AbstractClass {
public:
    ConcreteClass2();
    ~ConcreteClass2();
protected:
    void PrimitiveOperation1();
    void PrimitiveOperation2();
private:
};

#endif //~_TEMPLATE_H_