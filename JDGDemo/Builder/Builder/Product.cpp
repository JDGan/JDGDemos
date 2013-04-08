//
//  Product.cpp
//  Builder
//
//  Created by Gan LL on 13-3-25.
//  Copyright (c) 2013年 zdsoft. All rights reserved.
//

//Product.cpp
#include "Product.h"
#include <iostream> 
using namespace std;

Product::Product()
{
    ProducePart();
    cout<<"return a product"<<endl;
}

Product::~Product()
{
    
}

void Product::ProducePart()
{
    cout<<"build part of product.."<<endl;
}

ProductPart::ProductPart()
{
    ///cout<<"build productpart.."<<endl;
}

ProductPart::~ProductPart()
{
    
}

ProductPart* ProductPart::BuildPart()
{
    return new ProductPart;
}
