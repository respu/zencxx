[+ AutoGen5 template hh=%s.hh cc=%s.cc
#
#
# This is the autogen template file to produce header and module for new class.
# Check $(top_srcdir)/README for details of usage.
#
+]
/**
 * \file
 *
 * \brief Class \c [+ FOR namespace +][+ namespace +]::[+ ENDFOR +][+ classname +] [+ IF ( == (suffix) "hh") +](interface)[+ ELSE +](implementation)[+ ENDIF +]
 *
 * \date [+ (shell "LC_ALL=C date") +] -- Initial design
 */
/*
[+ (lgpl "ZenCxx" "" " * ") +]
 */[+define incguard+]__[+ (string-upcase (get "guard_base")) +]__[+ (string-upcase (get "filename")) +]_HH__[+enddef +][+
IF ( == (suffix) "hh") +]
[+(out-move (sprintf "%s.hh" (get "filename"))) +]
#ifndef [+ incguard +]
# define [+ incguard +]

// Project specific includes

// Standard includes

[+define ns-list +][+ FOR namespace " " +]namespace [+ namespace +] {[+ ENDFOR +][+ enddef +][+
define ns-rev-list +][+ FOR reverse_namespace ", " +][+ reverse_namespace +][+ ENDFOR +][+ enddef +][+
ns-list +]

/**
 * \brief [Type brief class description here]
 *
 * [More detailed description here]
 *
 */
class [+ classname +]
{
public:
    /// Default constructor
    [+ classname +]() {}
    /// Destructor
    virtual ~[+ classname +]() {}
};

[+ ns-close +]// namespace [+ ns-rev-list +]
#endif                                                      // [+ incguard +][+
(set-writable 1) +][+
ELSE +]

// Project specific includes
#include <[+ subdir +]/[+ filename +].hh>

// Standard includes

[+ ns-list +]

[+ ns-close +]// namespace [+ ns-rev-list +][+
(set-writable 1) +][+
ENDIF +]
