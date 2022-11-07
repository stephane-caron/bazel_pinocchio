#
# Copyright (c) 2016-2022 CNRS INRIA
# Source:
# https://github.com/stack-of-tasks/pinocchio/blob/2a4953eca3886d7cfcc3037c6944fe2b892d70fb/examples/overview-simple.py
# License: BSD-2-Clause
#

from __future__ import print_function

import pinocchio

model = pinocchio.buildSampleModelManipulator()
data = model.createData()

q = pinocchio.neutral(model)
v = pinocchio.utils.zero(model.nv)
a = pinocchio.utils.zero(model.nv)

tau = pinocchio.rnea(model,data,q,v,a)
print('tau = ', tau.T)
