//
//  Invoker.h
//  Command
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Invoker.h
#ifndef _INVOKER_H_
#define _INVOKER_H_
class Command;
class Invoker {
public:
    Invoker(Command* command);
    ~Invoker();
    void Invoke();
protected:
private:
    Command* _command;
};
#endif //~_INVOKER_H_