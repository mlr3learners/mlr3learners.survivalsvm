library(mlr3learners.survivalsvm)

test_that("surv.svm", {
  learner = lrn("surv.svm")
  fun = survivalsvm::survivalsvm
  exclude = c(
    "formula", # coerced internally
    "data", # coerced internally by task
    "subset", # coerced internally by task
    "time.variable.name", # unused alternative formulation to formula
    "status.variable.name" # unused alternative formulation to formula
  )

  ParamTest = run_paramtest(learner, fun, exclude)
  expect_true(ParamTest, info = paste0("\nMissing parameters:\n",
    paste0("- '", ParamTest$missing, "'", collapse = "\n")))
})
