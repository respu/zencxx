/**
 * \file
 *
 * \brief Types used internally in type checkers
 *
 * \date Wed Jul 24 05:53:51 MSK 2013 -- Initial design
 */
/*
 * Copyright (C) 2010-2013 Alex Turbov and contributors, all rights reserved.
 * This is free software. It is licensed for use, modification and
 * redistribution under the terms of the GNU Lesser General Public License,
 * version 3 or later <http://gnu.org/licenses/lgpl.html>
 *
 * ZenCxx is free software: you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * ZenCxx is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.";
 */

#ifndef __ZENCXX__TYPE_TRAITS__DETAILS__YES_NO_TYPE_HH__
# define __ZENCXX__TYPE_TRAITS__DETAILS__YES_NO_TYPE_HH__

// Project specific includes

// Standard includes

namespace zencxx { namespace details {

typedef char no_type;
typedef char (&yes_type)[2];

}}                                                          // namespace details, zencxx
#endif                                                      // __ZENCXX__TYPE_TRAITS__DETAILS__YES_NO_TYPE_HH__
