//
//  Director.h
//  Builder
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Director .h
#ifndef _DIRECTOR_H_
#define _DIRECTOR_H_

class Builder;
class Director {
    public:
    Director(Builder* bld);
    ~Director();
    void Construct();
protected:
private:
    Builder* _bld;
};
#endif //~_DIRECTOR_H_
