//
//  Invoker.cpp
//  Command
//
//  Created by Gan LL on 13-3-26.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Invoker.cpp
#include "Invoker.h" 
#include "Command.h"
#include <iostream>

Invoker::Invoker(Command* command)
{
    _command = command;
}

Invoker::~Invoker()
{
    delete _command;
}

void Invoker::Invoke()
{
    _command->Excute();
}