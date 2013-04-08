//
//  Leaf.h
//  Composite
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Leaf.h
#ifndef _LEAF_H_
#define _LEAF_H_
#include "Component.h"

class Leaf:public Component {
public:
    Leaf();
    ~Leaf();
    void Operation();
    
protected:
private:
};
#endif //~_LEAF_H_