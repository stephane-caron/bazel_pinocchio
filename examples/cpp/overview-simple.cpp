/*
 * Copyright (c) 2016-2022 CNRS INRIA
 * Source:
 * https://github.com/stack-of-tasks/pinocchio/blob/2a4953eca3886d7cfcc3037c6944fe2b892d70fb/examples/overview-simple.cpp
 * License: BSD-2-Clause
 */

#include <iostream>

#include "pinocchio/algorithm/joint-configuration.hpp"
#include "pinocchio/algorithm/rnea.hpp"
#include "pinocchio/parsers/sample-models.hpp"

int main() {
  pinocchio::Model model;
  pinocchio::buildModels::manipulator(model);
  pinocchio::Data data(model);

  Eigen::VectorXd q = pinocchio::neutral(model);
  Eigen::VectorXd v = Eigen::VectorXd::Zero(model.nv);
  Eigen::VectorXd a = Eigen::VectorXd::Zero(model.nv);

  const Eigen::VectorXd& tau = pinocchio::rnea(model, data, q, v, a);
  std::cout << "tau = " << tau.transpose() << std::endl;
}
