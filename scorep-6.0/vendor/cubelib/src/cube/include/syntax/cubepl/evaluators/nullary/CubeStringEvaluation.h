/****************************************************************************
**  CUBE        http://www.scalasca.org/                                   **
*****************************************************************************
**  Copyright (c) 1998-2018                                                **
**  Forschungszentrum Juelich GmbH, Juelich Supercomputing Centre          **
**                                                                         **
**  Copyright (c) 2009-2015                                                **
**  German Research School for Simulation Sciences GmbH,                   **
**  Laboratory for Parallel Programming                                    **
**                                                                         **
**  This software may be modified and distributed under the terms of       **
**  a BSD-style license.  See the COPYING file in the package base         **
**  directory for details.                                                 **
****************************************************************************/


#ifndef __STRING_EVALUATION_H
#define __STRING_EVALUATION_H 0


#include "CubeNullaryEvaluation.h"


namespace cube
{
class StringEvaluation : public NullaryEvaluation
{
protected:
public:
    StringEvaluation();

    virtual
    ~StringEvaluation();

    virtual
    std::string
    strEval() const;
};
};
#endif
