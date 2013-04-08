//
//  Command.h
//  Command
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Command.h
#ifndef _COMMAND_H_
#define _COMMAND_H_

class Reciever;
class Command {
public:
    virtual ~Command();
    virtual void Excute() = 0;
protected:
    Command();
   
private:
};

class ConcreteCommand:public Command {
public:
    ConcreteCommand(Reciever* rev);
    ~ConcreteCommand();
    void Excute();
protected:
private:
    Reciever* _rev;
};


template <class Reciever>
class SimpleCommand:public Command {
public:
    typedef void (Reciever::* Action)();
    SimpleCommand(Reciever* rev,Action act)
    {
        _rev = rev;
        _act = act;
    }
    virtual void Excute()
    {
        (_rev->* _act)();
    }
    ~SimpleCommand()
    {
        delete _rev;
    }
protected:
private:
    Reciever* _rev;
    Action _act;
};

#endif //~_COMMAND_H_